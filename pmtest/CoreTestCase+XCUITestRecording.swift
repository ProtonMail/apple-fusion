//
//  CoreTestCase+XCUITestRecording.swift
//  pmtest
//
//  Created by Aram Sargsyan on 29.01.22.
//

import XCTest

extension CoreTestCase: XCUITestCaseRecording {
    
    public func setTimeInterval(timeInterval: TimeInterval) {
        testRecorder.timeInterval = timeInterval
    }
    
    public func resumeRecording() {
        testRecorder.resumeRecording()
    }
    
    public func pauseRecording() {
        testRecorder.pauseRecording()
    }
    
    public func addGifAttachment() {
        if let gifAttachment = testRecorder.generateGifAttachment() {
            add(gifAttachment)
        }
    }
    
    public func addVideoAttachment() {
        let expectation = XCTestExpectation(description: "\(XCUITestCaseRecording.self).video")
        testRecorder.generateVideoAttachment { videoAttachment in
            if let videoAttachment = videoAttachment {
                self.add(videoAttachment)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 50)
    }
}
