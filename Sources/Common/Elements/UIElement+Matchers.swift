//
//  UIElement+Actions.swift
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

extension UIElement {
    
    public func byIndex(_ index: Int) -> UIElement {
        self.index = index
        return self
    }
    
    public func hasDescendant(_ element: UIElement) -> UIElement {
        self.containsType = element.getType()
        self.containsIdentifier = element.getIdentifier()
        self.containsPredicate = element.getPredicate()
        return self
    }
    
    public func containsLabel(_ label: String) -> UIElement {
        self.containLabel = label
        return self
    }
    
    public func isEnabled() -> UIElement {
        self.elementEnabled = true
        return self
    }
    
    public func isDisabled() -> UIElement {
        self.elementDisabled = true
        return self
    }
    
    public func isHittable() -> UIElement {
        self.elementHittable = true
        return self
    }
    
    public func firstMatch() -> UIElement {
        self.shouldUseFirstMatch = true
        return self
    }
    
    /**
     * Use it to specify in which table element test should swipe up or down in case of multiple tables in the layout hierarchy:
     * Example: cell(identifier).inTable(table(identifier)).swipeUpUntilVisible()
     */
    public func inTable(_ table: UIElement) -> UIElement {
        focusedTable = table.uiElement()
        return self
    }
    
    public func matchesPredicate(_ matchedPredicate: NSPredicate) -> UIElement {
        self.matchedPredicate = matchedPredicate
        return self
    }
    
    public func hasLabel(_ label: String) -> UIElement {
        return hasLabel(Predicate.labelEquals(label))
    }
    
    public func hasLabel(_ labelPredicate: NSPredicate) -> UIElement {
        self.labelPredicate = labelPredicate
        return self
    }
    
    public func hasTitle(_ title: String) -> UIElement {
        return hasTitle(Predicate.titleEquals(title))
    }
    
    public func hasTitle(_ titlePredicate: NSPredicate) -> UIElement {
        self.titlePredicate = titlePredicate
        return self
    }
    
    public func hasValue(_ value: String) -> UIElement {
        return hasValue(Predicate.valueEquals(value))
    }
    
    public func hasValue(_ valuePredicate: NSPredicate) -> UIElement {
        self.valuePredicate = valuePredicate
        return self
    }
    
}
