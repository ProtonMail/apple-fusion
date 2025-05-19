//
//  Condition.swift
//
//  ProtonMail - Created on 10.05.21.
//
//  The MIT License
//
//  Copyright (c) 2021 Proton Technologies AG
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

import XCTest

/**
 * Predicates that are used by Wait functions.
 */
internal struct Predicate {

    static var enabled: NSPredicate { NSPredicate(format: "isEnabled == true") }
    static var disabled: NSPredicate { NSPredicate(format: "isEnabled == false") }
    static var hittable: NSPredicate { NSPredicate(format: "hittable == true") }
    static var doesNotHittable: NSPredicate { NSPredicate(format: "hittable == false") }
    static var doesNotExist: NSPredicate { NSPredicate(format: "exists == false") }
    static var exists: NSPredicate { NSPredicate(format: "exists == true") }
    static var hasKeyboardFocus: NSPredicate { NSPredicate(format: "hasKeyboardFocus == true") }

    static func labelEquals(_ label: String) -> NSPredicate {
        NSPredicate(format: "label == %@", label)
    }

    static func titleEquals(_ title: String) -> NSPredicate {
        NSPredicate(format: "title == %@", title)
    }

    static func valueEquals(_ value: String) -> NSPredicate {
        NSPredicate(format: "value == %@", value)
    }
}
