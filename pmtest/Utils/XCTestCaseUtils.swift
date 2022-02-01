//
//  XCTestCaseUtils.swift
//  pmtest
//
//  Created by Aram Sargsyan on 28.01.22.
//

import XCTest

extension XCTestCase {

    func getTestMethodName() -> String {
        let testNames = self.name.split(separator: " ")
        let testMethodName = String(testNames[1].dropLast())
        return testMethodName
    }
}
