//
//  UIElement.swift
//
//  ProtonMail - Created on 02.02.21.
//
//  The MIT License
//
//  Copyright (c) 2020 Proton Technologies AG
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import XCTest

/**
 * Represents single XCUIElement and provides an interface for performing actions or checks.
 * By default each XCUIElement that is referenced by this class already has a wait functionality in place except check functions or checkDoesNotExist() function.
 * Check functions assume that element was already located before check is called. checkDoesNotExist() function shouldn't wait for the element.
 */

@available(*, deprecated, message: "`UiElement` has been renamed to `UIElement`.")
typealias UiElement = UIElement

// swiftlint:disable type_body_length
open class UIElement {

    init(_ query: XCUIElementQuery, _ elementType: XCUIElement.ElementType) {
        self.uiElementQuery = query
        self.elementType = elementType
    }

    init(_ identifier: String, _ query: XCUIElementQuery, _ elementType: XCUIElement.ElementType) {
        self.uiElementQuery = query
        self.identifier = identifier
        self.elementType = elementType
    }

    init(_ predicate: NSPredicate, _ query: XCUIElementQuery, _ elementType: XCUIElement.ElementType) {
        self.uiElementQuery = query
        self.predicate = predicate
        self.elementType = elementType
    }

    internal var elementType: XCUIElement.ElementType
    internal var uiElementQuery: XCUIElementQuery?
    internal var ancestorElement: XCUIElement?
    internal var parentElement: XCUIElement?
    internal var locatedElement: XCUIElement?
    internal var index: Int?
    internal var identifier: String?
    internal var childElement: UIElement?
    internal var descendantElement: UIElement?
    internal var elementEnabled: Bool?
    internal var elementDisabled: Bool?
    internal var elementHittable: Bool?
    internal var predicate: NSPredicate?
    internal var matchedPredicate: NSPredicate?
    internal var labelPredicate: NSPredicate?
    internal var titlePredicate: NSPredicate?
    internal var valuePredicate: NSPredicate?
    internal var focusedTable: XCUIElement?
    internal var containsType: XCUIElement.ElementType?
    internal var containsIdentifier: String?
    internal var containsPredicate: NSPredicate?
    internal var containLabel: String?
    internal var shouldUseFirstMatch: Bool = false
    internal var shouldWaitForExistance = true

    internal func getType() -> XCUIElement.ElementType {
        return elementType
    }

    internal func setType(_ elementQuery: XCUIElementQuery) -> UIElement {
        uiElementQuery = elementQuery
        return self
    }

    internal func getPredicate() -> NSPredicate? {
        return self.predicate
    }

    internal func getIdentifier() -> String? {
        return self.identifier
    }

    internal func getIndex() -> Int? {
        return self.index
    }

    /// Element properties
    public func label() -> String? {
        guard let element = uiElement() else {
            return nil
        }
        return element.label
    }

    public func placeholderValue() -> String? {
        guard let element = uiElement() else {
            return nil
        }
        return element.placeholderValue
    }

    public func title() -> String? {
        guard let element = uiElement() else {
            return nil
        }
        return element.title
    }

    public func value() -> Any? {
        guard let element = uiElement() else {
            return nil
        }
        return element.value
    }

    public func exists() -> Bool {
        guard let element = uiElement() else {
            return false
        }
        return element.exists
    }

    public func enabled() -> Bool {
        guard let element = uiElement() else {
            return false
        }
        return element.isEnabled
    }

    public func hittable() -> Bool {
        guard let element = uiElement() else {
            return false
        }
        return element.isHittable
    }

    public func selected() -> Bool {
        guard let element = uiElement() else {
            return false
        }
        return element.isSelected
    }

    public func childrenCount() -> Int {
        return uiElement()!.children(matching: XCUIElement.ElementType.any).count
    }

    public func childrenCountByType(_ type: XCUIElement.ElementType) -> Int {
        return uiElement()!.children(matching: type).count
    }

    public func childrenCountByPredicate(_ predicate: NSPredicate, _ type: XCUIElement.ElementType? = nil) -> Int {
        let elementType = type ?? .any
        return uiElement()!.children(matching: elementType).matching(predicate).count
    }

    public func descendantsCountByPredicate(_ predicate: NSPredicate, _ type: XCUIElement.ElementType? = nil) -> Int {
        let elementType = type ?? .any
        return uiElement()!.descendants(matching: elementType).matching(predicate).count
    }

    /**
     * The core function responsible for XCUIElement location logic.
     */
    // swiftlint:disable cyclomatic_complexity
    // swiftlint:disable function_body_length
    func uiElement() -> XCUIElement? {
        /// Return element instance if it was already located.
        if locatedElement != nil {
            shouldWaitForExistance = false
            return locatedElement!
        }

        /// Filter out XCUIElementQuery based on identifier or predicate value provided.
        if identifier != nil {
            if focusedTable != nil {
                uiElementQuery = currentApp!.tables[focusedTable!.identifier].descendants(matching: self.elementType).matching(identifier: identifier!)
            }
            uiElementQuery = uiElementQuery!.matching(identifier: identifier!)
        } else if predicate != nil {
            if focusedTable != nil {
                uiElementQuery = currentApp!.tables[focusedTable!.identifier].descendants(matching: self.elementType).matching(predicate!)
            }
            uiElementQuery = uiElementQuery!.matching(predicate!)
        }

        /// Fail test if both disabled and enbaled parameters were used.
        if elementDisabled == true && elementEnabled == true {
            XCTFail("Only one isDisabled() or isEnabled() function can be applied to query the element.", file: #file, line: #line)
        }

        /// Filter out XCUIElementQuery based on isEnabled / isDisabled state.
        if elementDisabled == true {
            uiElementQuery = uiElementQuery?.matching(Predicate.disabled)
        } else if elementEnabled == true {
            uiElementQuery = uiElementQuery?.matching(Predicate.enabled)
        }

        /// Filter out XCUIElementQuery based on element label predicate.
        if labelPredicate != nil {
            uiElementQuery = uiElementQuery?.matching(labelPredicate!)
        }

        /// Filter out XCUIElementQuery based on element title predicate.
        if titlePredicate != nil {
            uiElementQuery = uiElementQuery?.matching(titlePredicate!)
        }

        /// Filter out XCUIElementQuery based on element value predicate.
        if valuePredicate != nil {
            uiElementQuery = uiElementQuery?.matching(valuePredicate!)
        }

        /// Filter out XCUIElementQuery based on provided predicate.
        if matchedPredicate != nil {
            uiElementQuery = uiElementQuery?.matching(matchedPredicate!)
        }

        /// Filter out XCUIElementQuery based on isHittable state.
        if elementHittable == true {
            uiElementQuery = uiElementQuery?.matching(Predicate.hittable)
        }

        /// Matching elements by the sub-elements it contains
        if containsType != nil && containsIdentifier != nil {
            uiElementQuery = uiElementQuery!.containing(containsType!, identifier: containsIdentifier!)
        }

        if containsPredicate != nil {
            uiElementQuery = uiElementQuery!.containing(containsPredicate!)
        }

        if containLabel != nil {
            let predicate = NSPredicate(format: "label CONTAINS[c] %@", containLabel!)
            uiElementQuery = uiElementQuery!.containing(predicate)
        }

        if index != nil {
            /// Locate  XCUIElementQuery based on its index.
            locatedElement = uiElementQuery!.element(boundBy: index!)
        } else {
            /// Return matched element of given type.
            if shouldUseFirstMatch {
                locatedElement = uiElementQuery!.element.firstMatch
            } else {
                locatedElement = uiElementQuery!.element
            }
        }

        if childElement != nil {
            /// Return child element based on UiElement instance provided.
            locatedElement = locatedElement?.child(childElement!)
        } else if descendantElement != nil {
            /// Return descendant element based on UiElement instance provided.
            locatedElement = locatedElement?.descendant(descendantElement!)
        }

        if shouldWaitForExistance {
            return Wait().forElement(locatedElement!)
        } else {
            return locatedElement!
        }
    }
}
