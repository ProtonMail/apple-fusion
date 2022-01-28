//
//  XCUITestCaseRecording.swift
//  pmtest
//
//  Created by Aram Sargsyan on 26.01.22.
//

import XCTest

public protocol XCUITestCaseRecording: XCTestCase {
    func setTimeInterval(timeInterval: TimeInterval)
    func resumeRecording()
    func pauseRecording()
    func addGifAttachment()
    func addVideoAttachment()
}
