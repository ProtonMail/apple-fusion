//
//  UIElement+macOSExtension.swift
//  fusionMac
//
//  Created by Robert Patchett on 11.10.22.
//

#if os(OSX)
import XCTest
import fusionCommon

extension UIElement {

    @discardableResult
    public func pasteText(_ text: String) -> UIElement {
        uiElement()!.pasteText(text)
        return self
    }
}
#endif
