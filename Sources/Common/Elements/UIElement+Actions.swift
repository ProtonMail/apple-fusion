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

    /// Actions
    public func clearText() -> UIElement {
        uiElement()!.clearText()
        return self
    }

    @discardableResult
    public func doubleTap() -> UIElement {
        uiElement()!.doubleTap()
        return self
    }

    @discardableResult
    public func multiTap(_ count: Int) -> UIElement {
        let element = uiElement()!
        for _ in 0...count {
            element.tap()
        }
        return self
    }

    @discardableResult
    public func forceTap() -> UIElement {
        tapOnCoordinate(withOffset: .zero)
    }

    @discardableResult
    public func tapOnCoordinate(withOffset offset: CGVector) -> UIElement {
        let element = uiElement()!
        element.coordinate(withNormalizedOffset: offset).tap()
        return self
    }

    @discardableResult
    public func longPress(_ timeInterval: TimeInterval = 2) -> UIElement {
        uiElement()!.press(forDuration: timeInterval)
        return self
    }

    @discardableResult
    public func forcePress(_ timeInterval: TimeInterval = 2) -> UIElement {
        uiElement()!.coordinate(withNormalizedOffset: .zero).press(forDuration: timeInterval)
        return self
    }

    @discardableResult
    public func swipeDown() -> UIElement {
        uiElement()!.swipeDown()
        return self
    }

    @discardableResult
    public func swipeLeft() -> UIElement {
        uiElement()!.swipeLeft()
        return self
    }

    @discardableResult
    public func swipeRight() -> UIElement {
        uiElement()!.swipeRight()
        return self
    }

    @discardableResult
    public func swipeUp() -> UIElement {
        uiElement()!.swipeUp()
        return self
    }

    @discardableResult
    public func tapThenSwipeLeft( _ forDuration: TimeInterval, _ speed: XCUIGestureVelocity) -> UIElement {
        let start = uiElement()!.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.5))
        let finish = uiElement()!.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.5))
        start.press(forDuration: forDuration, thenDragTo: finish, withVelocity: speed, thenHoldForDuration: 0.1)
        return self
    }

    @discardableResult
    public func tapThenSwipeRight( _ forDuration: TimeInterval, _ speed: XCUIGestureVelocity) -> UIElement {
        let start = uiElement()!.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.5))
        let finish = uiElement()!.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.5))
        start.press(forDuration: forDuration, thenDragTo: finish, withVelocity: speed, thenHoldForDuration: 0.1)
        return self
    }

    @discardableResult
    public func tapThenSwipeDown( _ forDuration: TimeInterval, _ speed: XCUIGestureVelocity) -> UIElement {
        let start = uiElement()!.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.1))
        let finish = uiElement()!.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.9))
        start.press(forDuration: forDuration, thenDragTo: finish, withVelocity: speed, thenHoldForDuration: 0.1)
        return self
    }

    @discardableResult
    public func tapThenSwipeUp( _ forDuration: TimeInterval, _ speed: XCUIGestureVelocity) -> UIElement {
        let start = uiElement()!.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.9))
        let finish = uiElement()!.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.1))
        start.press(forDuration: forDuration, thenDragTo: finish, withVelocity: speed, thenHoldForDuration: 0.1)
        return self
    }

    @discardableResult
    public func tap() -> UIElement {
        uiElement()!.tap()
        return self
    }

    @discardableResult
    public func tapIfExists() -> UIElement {
        let element = uiElement()!
        if Wait().forElement(element).exists {
            element.tap()
        }
        return self
    }

    @discardableResult
    public func forceKeyboardFocus(_ retries: Int = 5) -> UIElement {
        var count = 0
        uiElement()!.tap()
        // Give xctest enough time to evaluate predicate.
        while !Wait().hasKeyboardFocus(uiElement()!) {
            if count < retries {
                uiElement()!.tap()
                count += 1
            } else {
                XCTFail("Unable to set the keyboard focus to element: \(String(describing: uiElement()?.debugDescription))")
            }
        }
        return self
    }

    @discardableResult
    public func swipeUpUntilVisible(maxAttempts: Int = 5) -> UIElement {
        var eventCount = 0
        var swipeArea: XCUIElement

        if focusedTable != nil {
            swipeArea = focusedTable!
        } else {
            swipeArea = currentApp!
        }

        while eventCount <= maxAttempts, !isVisible {
            swipeArea.swipeUp()
            eventCount += 1
        }
        return self
    }

    @discardableResult
    public func swipeDownUntilVisible(maxAttempts: Int = 5) -> UIElement {
        var eventCount = 0
        var swipeArea: XCUIElement

        if focusedTable != nil {
            swipeArea = focusedTable!
        } else {
            swipeArea = currentApp!
        }

        while eventCount <= maxAttempts, !isVisible {
            swipeArea.swipeDown()
            eventCount += 1
        }
        return self
    }

    /// Allow actions on children / descendants
    public func onChild(_ childElement: UIElement) -> UIElement {
        self.childElement = childElement
        return self
    }

    @discardableResult
    public func onDescendant(_ descendantElement: UIElement) -> UIElement {
        self.descendantElement = descendantElement
        return self
    }

    private var isVisible: Bool {
        guard uiElement()!.exists && !uiElement()!.frame.isEmpty else { return false }
        return currentApp!.windows.element(boundBy: 0).frame.contains(uiElement()!.frame)
    }
}
