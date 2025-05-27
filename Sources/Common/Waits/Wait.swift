//
//  Wait.swift
//
//  ProtonMail - Created on 12.10.20.
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
 * Contains wait functions and wait conditions that are used to wait for the elements.
 */
@MainActor
open class Wait {

    private let time: TimeInterval

    public init(time: TimeInterval = FusionConfig.Waits.defaultTimeout) {
        self.time = time
    }

    /**
     Waits for the element to exist but does not fail the test when condition is not met.
     */
    @discardableResult
    open func forElement(_ element: XCUIElement, _ file: StaticString = #filePath, _ line: UInt = #line) -> XCUIElement {
        waitSoftForCondition(element, Predicate.exists, file, line)
        return element
    }

    /**
     Waits for the element to be enabled and fails the test when condition is not met.
     */
    @discardableResult
    open func forElementToBeEnabled(
        _ element: XCUIElement,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) -> XCUIElement {
        waitForCondition(element, Predicate.enabled, file, line)
    }

    /**
     Waits for the element to be disabled and fails the test when condition is not met.
     */
    @discardableResult
    open func forElementToBeDisabled(
        _ element: XCUIElement,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) -> XCUIElement {
        waitForCondition(element, Predicate.disabled, file, line)
    }

    /**
     Waits for the element to be hittable and fails the test when condition is not met.
     */
    @discardableResult
    open func forElementToBeHittable(
        _ element: XCUIElement,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) -> XCUIElement {
        waitForCondition(element, Predicate.hittable, file, line)
    }

    /**
     Waits for the element to be not hittable and fails the test when condition is not met.
     */
    @discardableResult
    open func forElementToBeNotHittable(
        _ element: XCUIElement,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) -> XCUIElement {
        waitForCondition(element, Predicate.doesNotHittable, file, line)
    }

    /**
     Waits for the element to disappear and fails the test when condition is not met.
     */
    @discardableResult
    open func forElementToDisappear(
        _ element: XCUIElement,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) -> XCUIElement {
        waitForCondition(element, Predicate.doesNotExist, file, line)
    }

    /**
     Waits for the element having keyboard focus and fails the test when condition is not met.
     */
    @discardableResult
    open func forHavingKeyboardFocus(
        _ element: XCUIElement,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) -> XCUIElement {
        waitForCondition(element, Predicate.hasKeyboardFocus, file, line)
    }

    /**
     Waits for the element having keyboard focus but does not fail the test when condition is not met.
     */
    @discardableResult
    open func hasKeyboardFocus(
        _ element: XCUIElement,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) -> Bool {
        waitSoftForCondition(element, Predicate.hasKeyboardFocus, file, line)
    }

    /**
     Waits for the predicate and fails the test when is not met.
     */
    private func waitForCondition(
        _ element: XCUIElement,
        _ predicate: NSPredicate,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) -> XCUIElement {
        let isPredicateMet = wait(for: element, with: predicate)

        if !isPredicateMet {
            let message = """
                          Condition: <\(predicate.predicateFormat)> was NOT met
                          for element: <\(element)> after \(time) seconds timeout.
                          """
            XCTFail(message, file: file, line: line)
        }

        return element
    }

    /**
     Waits for the predicate and does not fail the test when is not met.
     */
    @discardableResult
    private func waitSoftForCondition(
        _ element: XCUIElement,
        _ predicate: NSPredicate,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) -> Bool {
        wait(for: element, with: predicate)
    }

    private func wait(for element: XCUIElement, with predicate: NSPredicate) -> Bool {
        let result = waitUntil(timeout: time, condition: predicate.evaluate(with: element))

        if result {
            FusionConfig.Waits.onSuccess?(element)
            // Handle async callback if available
            if #available(iOS 15.0, macOS 12.0, *) {
                if let asyncOnSuccess = FusionConfig.Waits.asyncOnSuccess {
                    Task { @MainActor in
                        await asyncOnSuccess(element)
                    }
                }
            }
        } else {
            FusionConfig.Waits.onFailure?(element)
            // Handle async callback if available
            if #available(iOS 15.0, macOS 12.0, *) {
                if let asyncOnFailure = FusionConfig.Waits.asyncOnFailure {
                    Task { @MainActor in
                        await asyncOnFailure(element)
                    }
                }
            }
        }

        return result
    }

    // MARK: - Async/Await Support for Swift 6

    /**
     Async version of forElement that properly handles Swift 6 concurrency.
     */
    @available(iOS 15.0, macOS 12.0, *)
    @discardableResult
    open func forElementAsync(_ element: XCUIElement, _ file: StaticString = #filePath, _ line: UInt = #line) async -> XCUIElement {
        await waitSoftForConditionAsync(element, Predicate.exists, file, line)
        return element
    }

    /**
     Async version of forElementToBeEnabled that properly handles Swift 6 concurrency.
     */
    @available(iOS 15.0, macOS 12.0, *)
    @discardableResult
    open func forElementToBeEnabledAsync(
        _ element: XCUIElement,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) async -> XCUIElement {
        await waitForConditionAsync(element, Predicate.enabled, file, line)
    }

    /**
     Async version of forElementToBeHittable that properly handles Swift 6 concurrency.
     */
    @available(iOS 15.0, macOS 12.0, *)
    @discardableResult
    open func forElementToBeHittableAsync(
        _ element: XCUIElement,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) async -> XCUIElement {
        await waitForConditionAsync(element, Predicate.hittable, file, line)
    }

    /**
     Async version of waitForCondition that properly handles Swift 6 concurrency.
     */
    @available(iOS 15.0, macOS 12.0, *)
    private func waitForConditionAsync(
        _ element: XCUIElement,
        _ predicate: NSPredicate,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) async -> XCUIElement {
        let isPredicateMet = await waitAsync(for: element, with: predicate)

        if !isPredicateMet {
            let message = """
                          Condition: <\(predicate.predicateFormat)> was NOT met
                          for element: <\(element)> after \(time) seconds timeout.
                          """
            XCTFail(message, file: file, line: line)
        }

        return element
    }

    /**
     Async version of waitSoftForCondition that properly handles Swift 6 concurrency.
     */
    @available(iOS 15.0, macOS 12.0, *)
    @discardableResult
    private func waitSoftForConditionAsync(
        _ element: XCUIElement,
        _ predicate: NSPredicate,
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) async -> Bool {
        await waitAsync(for: element, with: predicate)
    }

    /**
     Async version of wait that properly handles Swift 6 concurrency and async callbacks.
     */
    @available(iOS 15.0, macOS 12.0, *)
    private func waitAsync(for element: XCUIElement, with predicate: NSPredicate) async -> Bool {
        let result = waitUntil(timeout: time, condition: predicate.evaluate(with: element))

        if result {
            FusionConfig.Waits.onSuccess?(element)
            await FusionConfig.Waits.asyncOnSuccess?(element)
        } else {
            FusionConfig.Waits.onFailure?(element)
            await FusionConfig.Waits.asyncOnFailure?(element)
        }

        return result
    }

}
