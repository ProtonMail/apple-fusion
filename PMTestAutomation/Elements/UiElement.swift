//
//  File.swift
//  PMTestAutomation
//
//  Created by denys zelenchuk on 02.02.21.
//

import Foundation
import XCTest

internal var shouldRecordStacktrace = true

/**
 Represents single XCUIElement and provides an interface for performing actions or checks.
 By default each XCUIElement that is referenced by this class already has a wait functionality in place except check functions or checkDoesNotExist() function.
 Check functions assume that element was already located before check is called. checkDoesNotExist() function shouldn't wait for the element.
 */
public class UiElement {

    init(_ query: XCUIElementQuery) {
        self.uiElementQuery = query
        if shouldRecordStacktrace {
            issueDescription.append(StringUtils().formatCallers(CallStackParser.getCallingClassAndMethodInScope()))
        }
    }

    init(_ identifier: String, _ query: XCUIElementQuery) {
        self.uiElementQuery = query
        self.identifier = identifier
        if shouldRecordStacktrace {
            issueDescription.append(StringUtils().formatCallers(CallStackParser.getCallingClassAndMethodInScope()))
        }
    }

    init(_ predicate: NSPredicate, _ query: XCUIElementQuery) {
        self.uiElementQuery = query
        self.predicate = predicate
        if shouldRecordStacktrace {
            issueDescription.append(StringUtils().formatCallers(CallStackParser.getCallingClassAndMethodInScope()))
        }
    }

    internal var uiElementQuery: XCUIElementQuery?
    private let app = XCUIApplication()
    private var locatedElement: XCUIElement?
    private var index: Int?
    private var identifier: String?
    private var predicate: NSPredicate?
    private var childElement: UiElement?
    private var descendantElement: UiElement?

    internal func getType() -> XCUIElement.ElementType {
        return self.uiElement().elementType
    }

    internal func setType(_ elementQuery: XCUIElementQuery) -> UiElement {
        uiElementQuery = elementQuery
        return self
    }

    internal func getIdentifier() -> String? {
        return self.identifier!
    }

    /// Locator by index
    func byIndex(_ index: Int) -> UiElement {
        self.index = index
        return self
    }

    /// Actions
    func clearText() -> UiElement {
        Wait().forElement(uiElement()).clearText()
        return self
    }

    @discardableResult
    func doubleTap() -> UiElement {
        Wait().forElement(uiElement()).doubleTap()
        return self
    }

    @discardableResult
    func longPress() -> UiElement {
        Wait().forElement(uiElement()).press(forDuration: 2)
        return self
    }

    @discardableResult
    func swipeDown() -> UiElement {
        Wait().forElement(uiElement()).swipeDown()
        return self
    }

    @discardableResult
    func swipeLeft() -> UiElement {
        Wait().forElement(uiElement()).swipeLeft()
        return self
    }

    @discardableResult
    func swipeRight() -> UiElement {
        Wait().forElement(uiElement()).swipeRight()
        return self
    }

    @discardableResult
    func swipeUp() -> UiElement {
        Wait().forElement(uiElement()).swipeUp()
        return self
    }

    @discardableResult
    func tap() -> UiElement {
        Wait().forElement(uiElement()).tap()
        return self
    }

    @discardableResult
    func typeText(_ text: String) -> UiElement {
        Wait().forElement(uiElement()).typeText(text)
        return self
    }

    @discardableResult
    func swipeUpUntilVisible(maxAttempts: Int = 5) -> UiElement {
        var eventCount = 0
        let table = app.tables.element

        while eventCount <= maxAttempts, !isVisible {
            table.swipeUp()
            eventCount += 1
        }
        return self
    }

    @discardableResult
    func swipeDownUntilVisible(maxAttempts: Int = 5) -> UiElement {
        var eventCount = 0
        let table = app.tables.element

        while eventCount <= maxAttempts, !self.isVisible {
            table.swipeDown()
            eventCount += 1
        }
        return self
    }

    /// Allow actions on childs / descendants
    func onChild(_ childElement: UiElement) -> UiElement {
        self.childElement = childElement
        return self
    }

    func onDescendant(_ descendantElement: UiElement) -> UiElement {
        self.descendantElement = descendantElement
        return self
    }

    /// Checks
    @discardableResult
    func checkExists() -> UiElement {
        XCTAssertTrue(uiElement().exists, "Button element \(uiElement().debugDescription) does not exist.", file: #file, line: #line)
        return self
    }

    @discardableResult
    func checkIsHittable() -> UiElement {
        XCTAssertTrue(uiElement().isHittable, "Button element \(uiElement().debugDescription) does not exist.", file: #file, line: #line)
        return self
    }

    @discardableResult
    func checkDoesNotExist() -> UiElement {
        XCTAssertFalse(uiElement().exists, "Cell element \(uiElement().debugDescription) exists but it should not.", file: #file, line: #line)
        return self
    }

    @discardableResult
    func checkHasChild(_ childElement: UiElement) -> UiElement {
        let locatedElement = uiElement().child(childElement)
        XCTAssertTrue(locatedElement.exists, "Expected to have StaticText element with identifier: \"\(String(describing: identifier))\" but found nothing.")
        return self
    }

    @discardableResult
    func checkHasDescendant(_ descendantElement: UiElement) -> UiElement {
        let locatedElement = uiElement().descendant(descendantElement)
        XCTAssertTrue(locatedElement.exists, "Expected to have descendant element with identifier: \"\(String(describing: identifier))\" but found nothing.")
        return self
    }

    @discardableResult
    func checkHasLabel(_ text: String) -> UiElement {
        guard let label = uiElement().label as? String else {
            XCTFail("Element doesn't have text label.")
            return self
        }
        XCTAssertTrue(label == text, "Expected Element text label to be: \"\(text)\", but found: \"\(label)\"")
        return self
    }

    @discardableResult
    func checkHasValue(_ value: String) -> UiElement {
        guard let stringValue = uiElement().value as? String else {
            XCTFail("Element doesn't have text value.")
            return self
        }
        XCTAssertTrue(stringValue == value, "Expected Element text value to be: \"\(value)\", but found: \"\(stringValue)\"")
        return self
    }

    /// Waits
    @discardableResult
    func wait() -> UiElement {
        Wait().forElement(uiElement())
        return self
    }

    @discardableResult
    func waitForHittable() -> UiElement {
        Wait().forElementToBeHittable(uiElement())
        return self
    }

    @discardableResult
    func waitForEnabled() -> UiElement {
        Wait().forElementToBeEnabled(uiElement())
        return self
    }

    @discardableResult
    func waitUntilGone() -> UiElement {
        Wait().forElementToDisappear(uiElement())
        return self
    }

    internal func uiElement() -> XCUIElement {
        /// Return element instance if it was already located.
        if locatedElement != nil {
            return locatedElement!
        }

        /// Fail test if identifier, predicate and index are nil.
        if identifier == nil && predicate == nil && index == nil {
            XCTFail("Unable to locate an element when its identifier and element index is nil.", file: #file, line: #line)
        }

        /// Locate element based on identifier, predicate or index value provided.
        if identifier != nil {
            locatedElement = uiElementQuery![identifier!]
        } else if predicate != nil {
            locatedElement = uiElementQuery!.element(matching: predicate!)
        } else {
            locatedElement = uiElementQuery!.element(boundBy: index!)
        }

        /// Locates child element based on UiElement instance provided.
        if childElement != nil {
            return locatedElement!.child(childElement!)
        }

        /// Locates descendant element based on UiElement instance provided.
        if descendantElement != nil {
            return locatedElement!.descendant(descendantElement!)
        }
        return locatedElement!
    }

    private var isVisible: Bool {
        guard uiElement().exists && !uiElement().frame.isEmpty else { return false }
        return app.windows.element(boundBy: 0).frame.contains(uiElement().frame)
    }
}
