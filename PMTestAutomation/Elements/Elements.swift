//
//  File.swift
//  PMTestAutomation
//
//  Created by denys zelenchuk on 02.02.21.
//

import Foundation
import XCTest

/**
 Collection of all XCUIElement types that can be used in UI testing.
 */
open class Elements {

    open func acttivityIndicator() -> UiElement { UiElement(XCUIApplication().activityIndicators) }
    open func acttivityIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().activityIndicators) }
    open func activityIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().activityIndicators) }

    open func alert() -> UiElement { UiElement(XCUIApplication().alerts) }
    open func alert(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().alerts) }
    open func alert(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().alerts) }

    open func browser() -> UiElement { UiElement(XCUIApplication().browsers) }
    open func browser(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().browsers) }
    open func browser(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().browsers) }

    open func button() -> UiElement { UiElement(XCUIApplication().buttons) }
    open func button(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().buttons) }
    open func button(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().buttons) }

    open func cell() -> UiElement { UiElement(XCUIApplication().cells) }
    open func cell(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().cells) }
    open func cell(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().cells) }

    open func checkBox() -> UiElement { UiElement(XCUIApplication().checkBoxes) }
    open func checkBox(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().checkBoxes) }
    open func checkBox(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().checkBoxes) }

    open func collectionView() -> UiElement { UiElement(XCUIApplication().collectionViews) }
    open func collectionView(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().collectionViews) }
    open func collectionView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().collectionViews) }

    open func colorWell() -> UiElement { UiElement(XCUIApplication().colorWells) }
    open func colorWell(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().colorWells) }
    open func colorWell(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().colorWells) }

    open func comboBox() -> UiElement { UiElement(XCUIApplication().comboBoxes) }
    open func comboBox(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().comboBoxes) }
    open func comboBox(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().comboBoxes) }

    open func datePicker() -> UiElement { UiElement(XCUIApplication().datePickers) }
    open func datePicker(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().datePickers) }
    open func datePicker(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().datePickers) }

    open func decrementArrow() -> UiElement { UiElement(XCUIApplication().decrementArrows) }
    open func decrementArrow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().decrementArrows) }
    open func decrementArrow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().decrementArrows) }

    open func dialog() -> UiElement { UiElement(XCUIApplication().dialogs) }
    open func dialog(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().dialogs) }
    open func dialog(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().dialogs) }

    open func disclosedChildRow() -> UiElement { UiElement(XCUIApplication().disclosedChildRows) }
    open func disclosedChildRow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().disclosedChildRows) }
    open func disclosedChildRow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().disclosedChildRows) }

    open func disclosureTriangle() -> UiElement { UiElement(XCUIApplication().disclosureTriangles) }
    open func disclosureTriangle(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().disclosureTriangles) }
    open func disclosureTriangle(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().disclosureTriangles) }

    open func dockItem() -> UiElement { UiElement(XCUIApplication().dockItems) }
    open func dockItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().dockItems) }
    open func dockItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().dockItems) }

    open func drawer() -> UiElement { UiElement(XCUIApplication().drawers) }
    open func drawer(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().drawers) }
    open func drawer(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().drawers) }

    open func grid() -> UiElement { UiElement(XCUIApplication().grids) }
    open func grid(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().grids) }
    open func grid(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().grids) }

    open func group() -> UiElement { UiElement(XCUIApplication().groups) }
    open func group(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().groups) }
    open func group(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().groups) }

    open func handle() -> UiElement { UiElement(XCUIApplication().handles) }
    open func handle(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().handles) }
    open func handle(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().handles) }

    open func helpTag() -> UiElement { UiElement(XCUIApplication().helpTags) }
    open func helpTag(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().helpTags) }
    open func helpTag(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().helpTags) }

    open func icon() -> UiElement { UiElement(XCUIApplication().icons) }
    open func icon(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().icons) }
    open func icon(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().icons) }

    open func image() -> UiElement { UiElement(XCUIApplication().images) }
    open func image(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().images) }
    open func image(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().images) }

    open func incrementArrow() -> UiElement { UiElement(XCUIApplication().incrementArrows) }
    open func incrementArrow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().incrementArrows) }
    open func incrementArrow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().incrementArrows) }

    open func keyboard() -> UiElement { UiElement(XCUIApplication().keyboards) }
    open func keyboard(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().keyboards) }
    open func keyboard(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().keyboards) }

    open func key() -> UiElement { UiElement(XCUIApplication().keys) }
    open func key(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().keys) }
    open func key(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().keys) }

    open func layoutArea() -> UiElement { UiElement(XCUIApplication().layoutAreas) }
    open func layoutArea(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().layoutAreas) }
    open func layoutArea(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().layoutAreas) }

    open func layoutItem() -> UiElement { UiElement(XCUIApplication().layoutItems) }
    open func layoutItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().layoutItems) }
    open func layoutItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().layoutItems) }

    open func levelIndicator() -> UiElement { UiElement(XCUIApplication().levelIndicators) }
    open func levelIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().levelIndicators) }
    open func levelIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().levelIndicators) }

    open func link() -> UiElement { UiElement(XCUIApplication().links) }
    open func link(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().links) }
    open func link(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().links) }

    open func map() -> UiElement { UiElement(XCUIApplication().maps) }
    open func map(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().maps) }
    open func map(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().maps) }

    open func matte() -> UiElement { UiElement(XCUIApplication().mattes) }
    open func matte(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().mattes) }
    open func matte(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().mattes) }

    open func menuBar() -> UiElement { UiElement(XCUIApplication().menuBars) }
    open func menuBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menuBars) }
    open func menuBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menuBars) }

    open func menuBarItem() -> UiElement { UiElement(XCUIApplication().menuBarItems) }
    open func menuBarItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menuBarItems) }
    open func menuBarItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menuBarItems) }

    open func menuButton() -> UiElement { UiElement(XCUIApplication().menuButtons) }
    open func menuButton(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menuButtons) }
    open func menuButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menuButtons) }

    open func menuItem() -> UiElement { UiElement(XCUIApplication().menuItems) }
    open func menuItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menuItems) }
    open func menuItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menuItems) }

    open func menu() -> UiElement { UiElement(XCUIApplication().menus) }
    open func menu(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menus) }
    open func menu(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menus) }

    open func navigationBar() -> UiElement { UiElement(XCUIApplication().navigationBars) }
    open func navigationBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().navigationBars) }
    open func navigationBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().navigationBars) }

    open func otherElement() -> UiElement { UiElement(XCUIApplication().otherElements) }
    open func otherElement(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().otherElements) }
    open func otherElement(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().otherElements) }

    open func outline() -> UiElement { UiElement(XCUIApplication().outlines) }
    open func outline(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().outlines) }
    open func outline(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().outlines) }

    open func outlineRow() -> UiElement { UiElement(XCUIApplication().outlineRows) }
    open func outlineRow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().outlineRows) }
    open func outlineRow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().outlineRows) }

    open func pageIndicator() -> UiElement { UiElement(XCUIApplication().pageIndicators) }
    open func pageIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().pageIndicators) }
    open func pageIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().pageIndicators) }

    open func picker() -> UiElement { UiElement(XCUIApplication().pickers) }
    open func picker(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().pickers) }
    open func picker(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().pickers) }

    open func pickerWheel() -> UiElement { UiElement(XCUIApplication().pickerWheels) }
    open func pickerWheel(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().pickerWheels) }
    open func pickerWheel(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().pickerWheels) }

    open func popover() -> UiElement { UiElement(XCUIApplication().popovers) }
    open func popover(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().popovers) }
    open func popover(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().popovers) }

    open func popUpButton() -> UiElement { UiElement(XCUIApplication().popUpButtons) }
    open func popUpButton(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().popUpButtons) }
    open func popUpButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().popUpButtons) }

    open func progressIndicator() -> UiElement { UiElement(XCUIApplication().progressIndicators) }
    open func progressIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().progressIndicators) }
    open func progressIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().progressIndicators) }

    open func radioButton() -> UiElement { UiElement(XCUIApplication().radioButtons) }
    open func radioButton(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().radioButtons) }
    open func radioButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().radioButtons) }

    open func radioGroup() -> UiElement { UiElement(XCUIApplication().radioGroups) }
    open func radioGroup(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().radioGroups) }
    open func radioGroup(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().radioGroups) }

    open func ratingIndicator() -> UiElement { UiElement(XCUIApplication().ratingIndicators) }
    open func ratingIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().ratingIndicators) }
    open func ratingIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().ratingIndicators) }

    open func relevanceIndicator() -> UiElement { UiElement(XCUIApplication().relevanceIndicators) }
    open func relevanceIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().relevanceIndicators) }
    open func relevanceIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().relevanceIndicators) }

    open func rulerMarker() -> UiElement { UiElement(XCUIApplication().rulerMarkers) }
    open func rulerMarker(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().rulerMarkers) }
    open func rulerMarker(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().rulerMarkers) }

    open func ruler() -> UiElement { UiElement(XCUIApplication().rulers) }
    open func ruler(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().rulers) }
    open func ruler(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().rulers) }

    open func scrollBar() -> UiElement { UiElement(XCUIApplication().scrollBars) }
    open func scrollBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().scrollBars) }
    open func scrollBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().scrollBars) }

    open func scrollView() -> UiElement { UiElement(XCUIApplication().scrollViews) }
    open func scrollView(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().scrollViews) }
    open func scrollView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().scrollViews) }

    open func searchField() -> UiElement { UiElement(XCUIApplication().searchFields) }
    open func searchField(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().searchFields) }
    open func searchField(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().searchFields) }

    open func secureTextField() -> UiElement { UiElement(XCUIApplication().secureTextFields) }
    open func secureTextField(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().secureTextFields) }
    open func secureTextField(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().secureTextFields) }

    open func segmentedControl() -> UiElement { UiElement(XCUIApplication().segmentedControls) }
    open func segmentedControl(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().segmentedControls) }
    open func segmentedControl(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().segmentedControls) }

    open func sheet() -> UiElement { UiElement(XCUIApplication().sheets) }
    open func sheet(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().sheets) }
    open func sheet(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().sheets) }

    open func slider() -> UiElement { UiElement(XCUIApplication().sliders) }
    open func slider(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().sliders) }
    open func slider(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().sliders) }

    open func splitGroup() -> UiElement { UiElement(XCUIApplication().splitGroups) }
    open func splitGroup(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().splitGroups) }
    open func splitGroup(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().splitGroups) }

    open func splitter() -> UiElement { UiElement(XCUIApplication().splitters) }
    open func splitter(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().splitters) }
    open func splitter(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().splitters) }

    open func staticText() -> UiElement { UiElement(XCUIApplication().staticTexts) }
    open func staticText(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().staticTexts) }
    open func staticText(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().staticTexts) }

    open func statusBar() -> UiElement { UiElement(XCUIApplication().statusBars) }
    open func statusBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().statusBars) }
    open func statusBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().statusBars) }

    open func statusItem() -> UiElement { UiElement(XCUIApplication().statusItems) }
    open func statusItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().statusItems) }
    open func statusItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().statusItems) }

    open func stepper() -> UiElement { UiElement(XCUIApplication().steppers) }
    open func stepper(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().steppers) }
    open func stepper(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().steppers) }

    open func swittch() -> UiElement { UiElement(XCUIApplication().switches) }
    open func swittch(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().switches) }
    open func swittch(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().switches) }

    open func tab() -> UiElement { UiElement(XCUIApplication().tabs) }
    open func tab(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tabs) }
    open func tab(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tabs) }

    open func tabBar() -> UiElement { UiElement(XCUIApplication().tabBars) }
    open func tabBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tabBars) }
    open func tabBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tabBars) }

    open func tabGroup() -> UiElement { UiElement(XCUIApplication().tabGroups) }
    open func tabGroup(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tabGroups) }
    open func tabGroup(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tabGroups) }

    open func table() -> UiElement { UiElement(XCUIApplication().tables) }
    open func table(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tables) }
    open func table(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tables) }

    open func tableColumn() -> UiElement { UiElement(XCUIApplication().tableColumns) }
    open func tableColumn(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tableColumns) }
    open func tableColumn(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tableColumns) }

    open func tableRow() -> UiElement { UiElement(XCUIApplication().tableRows) }
    open func tableRow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tableRows) }
    open func tableRow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tableRows) }

    open func textField() -> UiElement { UiElement(XCUIApplication().textFields) }
    open func textField(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().textFields) }
    open func textField(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().textFields) }

    open func textView() -> UiElement { UiElement(XCUIApplication().textViews) }
    open func textView(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().textViews) }
    open func textView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().textViews) }

    open func timeline() -> UiElement { UiElement(XCUIApplication().timelines) }
    open func timeline(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().timelines) }
    open func timeline(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().timelines) }

    open func toggle() -> UiElement { UiElement(XCUIApplication().toggles) }
    open func toggle(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().toggles) }
    open func toggle(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().toggles) }

    open func toolbarButton() -> UiElement { UiElement(XCUIApplication().toolbarButtons) }
    open func toolbarButton(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().toolbarButtons) }
    open func toolbarButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().toolbarButtons) }

    open func toolbar() -> UiElement { UiElement(XCUIApplication().toolbars) }
    open func toolbar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().toolbars) }
    open func toolbar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().toolbars) }

    open func touchBar() -> UiElement { UiElement(XCUIApplication().touchBars) }
    open func touchBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().touchBars) }
    open func touchBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().touchBars) }

    open func valueIndicator() -> UiElement { UiElement(XCUIApplication().valueIndicators) }
    open func valueIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().valueIndicators) }
    open func valueIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().valueIndicators) }

    open func webView() -> UiElement { UiElement(XCUIApplication().webViews) }
    open func webView(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().webViews) }
    open func webView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().webViews) }

    open func windows() -> UiElement { UiElement(XCUIApplication().windows) }
    open func windows(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().windows) }
    open func windows(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().windows) }
}
