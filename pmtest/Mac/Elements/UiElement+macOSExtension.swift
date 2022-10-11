//
//  UiElement+macOSExtension.swift
//  pmtestMac
//
//  Created by Robert Patchett on 11.10.22.
//

import XCTest

extension UiElement {

    @discardableResult
    public func pasteText(_ text: String) -> UiElement {
        uiElement()!.pasteText(text)
        return self
    }
}
