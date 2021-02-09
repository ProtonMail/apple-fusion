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
public class Elements {

    func acttivityIndicator() -> UiElement { UiElement(XCUIApplication().activityIndicators) }
    func acttivityIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().activityIndicators) }
    func activityIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().activityIndicators) }

    func alert() -> UiElement { UiElement(XCUIApplication().alerts) }
    func alert(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().alerts) }
    func alert(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().alerts) }

    func browser() -> UiElement { UiElement(XCUIApplication().browsers) }
    func browser(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().browsers) }
    func browser(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().browsers) }

    func button() -> UiElement { UiElement(XCUIApplication().buttons) }
    func button(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().buttons) }
    func button(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().buttons) }

    func cell() -> UiElement { UiElement(XCUIApplication().cells) }
    func cell(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().cells) }
    func cell(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().cells) }

    func checkBox() -> UiElement { UiElement(XCUIApplication().checkBoxes) }
    func checkBox(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().checkBoxes) }
    func checkBox(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().checkBoxes) }

    func collectionView() -> UiElement { UiElement(XCUIApplication().collectionViews) }
    func collectionView(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().collectionViews) }
    func collectionView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().collectionViews) }

    func colorWell() -> UiElement { UiElement(XCUIApplication().colorWells) }
    func colorWell(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().colorWells) }
    func colorWell(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().colorWells) }

    func comboBox() -> UiElement { UiElement(XCUIApplication().comboBoxes) }
    func comboBox(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().comboBoxes) }
    func comboBox(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().comboBoxes) }

    func datePicker() -> UiElement { UiElement(XCUIApplication().datePickers) }
    func datePicker(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().datePickers) }
    func datePicker(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().datePickers) }

    func decrementArrow() -> UiElement { UiElement(XCUIApplication().decrementArrows) }
    func decrementArrow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().decrementArrows) }
    func decrementArrow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().decrementArrows) }

    func dialog() -> UiElement { UiElement(XCUIApplication().dialogs) }
    func dialog(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().dialogs) }
    func dialog(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().dialogs) }

    func disclosedChildRow() -> UiElement { UiElement(XCUIApplication().disclosedChildRows) }
    func disclosedChildRow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().disclosedChildRows) }
    func disclosedChildRow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().disclosedChildRows) }

    func disclosureTriangle() -> UiElement { UiElement(XCUIApplication().disclosureTriangles) }
    func disclosureTriangle(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().disclosureTriangles) }
    func disclosureTriangle(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().disclosureTriangles) }

    func dockItem() -> UiElement { UiElement(XCUIApplication().dockItems) }
    func dockItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().dockItems) }
    func dockItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().dockItems) }

    func drawer() -> UiElement { UiElement(XCUIApplication().drawers) }
    func drawer(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().drawers) }
    func drawer(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().drawers) }

    func grid() -> UiElement { UiElement(XCUIApplication().grids) }
    func grid(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().grids) }
    func grid(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().grids) }

    func group() -> UiElement { UiElement(XCUIApplication().groups) }
    func group(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().groups) }
    func group(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().groups) }

    func handle() -> UiElement { UiElement(XCUIApplication().handles) }
    func handle(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().handles) }
    func handle(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().handles) }

    func helpTag() -> UiElement { UiElement(XCUIApplication().helpTags) }
    func helpTag(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().helpTags) }
    func helpTag(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().helpTags) }

    func icon() -> UiElement { UiElement(XCUIApplication().icons) }
    func icon(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().icons) }
    func icon(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().icons) }

    func image() -> UiElement { UiElement(XCUIApplication().images) }
    func image(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().images) }
    func image(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().images) }

    func incrementArrow() -> UiElement { UiElement(XCUIApplication().incrementArrows) }
    func incrementArrow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().incrementArrows) }
    func incrementArrow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().incrementArrows) }

    func keyboard() -> UiElement { UiElement(XCUIApplication().keyboards) }
    func keyboard(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().keyboards) }
    func keyboard(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().keyboards) }

    func key() -> UiElement { UiElement(XCUIApplication().keys) }
    func key(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().keys) }
    func key(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().keys) }

    func layoutArea() -> UiElement { UiElement(XCUIApplication().layoutAreas) }
    func layoutArea(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().layoutAreas) }
    func layoutArea(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().layoutAreas) }

    func layoutItem() -> UiElement { UiElement(XCUIApplication().layoutItems) }
    func layoutItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().layoutItems) }
    func layoutItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().layoutItems) }

    func levelIndicator() -> UiElement { UiElement(XCUIApplication().levelIndicators) }
    func levelIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().levelIndicators) }
    func levelIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().levelIndicators) }

    func link() -> UiElement { UiElement(XCUIApplication().links) }
    func link(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().links) }
    func link(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().links) }

    func map() -> UiElement { UiElement(XCUIApplication().maps) }
    func map(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().maps) }
    func map(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().maps) }

    func matte() -> UiElement { UiElement(XCUIApplication().mattes) }
    func matte(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().mattes) }
    func matte(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().mattes) }

    func menuBar() -> UiElement { UiElement(XCUIApplication().menuBars) }
    func menuBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menuBars) }
    func menuBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menuBars) }

    func menuBarItem() -> UiElement { UiElement(XCUIApplication().menuBarItems) }
    func menuBarItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menuBarItems) }
    func menuBarItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menuBarItems) }

    func menuButton() -> UiElement { UiElement(XCUIApplication().menuButtons) }
    func menuButton(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menuButtons) }
    func menuButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menuButtons) }

    func menuItem() -> UiElement { UiElement(XCUIApplication().menuItems) }
    func menuItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menuItems) }
    func menuItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menuItems) }

    func menu() -> UiElement { UiElement(XCUIApplication().menus) }
    func menu(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().menus) }
    func menu(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().menus) }

    func navigationBar() -> UiElement { UiElement(XCUIApplication().navigationBars) }
    func navigationBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().navigationBars) }
    func navigationBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().navigationBars) }

    func otherElement() -> UiElement { UiElement(XCUIApplication().otherElements) }
    func otherElement(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().otherElements) }
    func otherElement(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().otherElements) }

    func outline() -> UiElement { UiElement(XCUIApplication().outlines) }
    func outline(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().outlines) }
    func outline(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().outlines) }

    func outlineRow() -> UiElement { UiElement(XCUIApplication().outlineRows) }
    func outlineRow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().outlineRows) }
    func outlineRow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().outlineRows) }

    func pageIndicator() -> UiElement { UiElement(XCUIApplication().pageIndicators) }
    func pageIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().pageIndicators) }
    func pageIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().pageIndicators) }

    func picker() -> UiElement { UiElement(XCUIApplication().pickers) }
    func picker(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().pickers) }
    func picker(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().pickers) }

    func pickerWheel() -> UiElement { UiElement(XCUIApplication().pickerWheels) }
    func pickerWheel(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().pickerWheels) }
    func pickerWheel(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().pickerWheels) }

    func popover() -> UiElement { UiElement(XCUIApplication().popovers) }
    func popover(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().popovers) }
    func popover(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().popovers) }

    func popUpButton() -> UiElement { UiElement(XCUIApplication().popUpButtons) }
    func popUpButton(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().popUpButtons) }
    func popUpButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().popUpButtons) }

    func progressIndicator() -> UiElement { UiElement(XCUIApplication().progressIndicators) }
    func progressIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().progressIndicators) }
    func progressIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().progressIndicators) }

    func radioButton() -> UiElement { UiElement(XCUIApplication().radioButtons) }
    func radioButton(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().radioButtons) }
    func radioButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().radioButtons) }

    func radioGroup() -> UiElement { UiElement(XCUIApplication().radioGroups) }
    func radioGroup(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().radioGroups) }
    func radioGroup(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().radioGroups) }

    func ratingIndicator() -> UiElement { UiElement(XCUIApplication().ratingIndicators) }
    func ratingIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().ratingIndicators) }
    func ratingIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().ratingIndicators) }

    func relevanceIndicator() -> UiElement { UiElement(XCUIApplication().relevanceIndicators) }
    func relevanceIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().relevanceIndicators) }
    func relevanceIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().relevanceIndicators) }

    func rulerMarker() -> UiElement { UiElement(XCUIApplication().rulerMarkers) }
    func rulerMarker(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().rulerMarkers) }
    func rulerMarker(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().rulerMarkers) }

    func ruler() -> UiElement { UiElement(XCUIApplication().rulers) }
    func ruler(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().rulers) }
    func ruler(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().rulers) }

    func scrollBar() -> UiElement { UiElement(XCUIApplication().scrollBars) }
    func scrollBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().scrollBars) }
    func scrollBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().scrollBars) }

    func scrollView() -> UiElement { UiElement(XCUIApplication().scrollViews) }
    func scrollView(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().scrollViews) }
    func scrollView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().scrollViews) }

    func searchField() -> UiElement { UiElement(XCUIApplication().searchFields) }
    func searchField(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().searchFields) }
    func searchField(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().searchFields) }

    func secureTextField() -> UiElement { UiElement(XCUIApplication().secureTextFields) }
    func secureTextField(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().secureTextFields) }
    func secureTextField(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().secureTextFields) }

    func segmentedControl() -> UiElement { UiElement(XCUIApplication().segmentedControls) }
    func segmentedControl(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().segmentedControls) }
    func segmentedControl(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().segmentedControls) }

    func sheet() -> UiElement { UiElement(XCUIApplication().sheets) }
    func sheet(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().sheets) }
    func sheet(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().sheets) }

    func slider() -> UiElement { UiElement(XCUIApplication().sliders) }
    func slider(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().sliders) }
    func slider(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().sliders) }

    func splitGroup() -> UiElement { UiElement(XCUIApplication().splitGroups) }
    func splitGroup(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().splitGroups) }
    func splitGroup(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().splitGroups) }

    func splitter() -> UiElement { UiElement(XCUIApplication().splitters) }
    func splitter(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().splitters) }
    func splitter(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().splitters) }

    func staticText() -> UiElement { UiElement(XCUIApplication().staticTexts) }
    func staticText(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().staticTexts) }
    func staticText(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().staticTexts) }

    func statusBar() -> UiElement { UiElement(XCUIApplication().statusBars) }
    func statusBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().statusBars) }
    func statusBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().statusBars) }

    func statusItem() -> UiElement { UiElement(XCUIApplication().statusItems) }
    func statusItem(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().statusItems) }
    func statusItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().statusItems) }

    func stepper() -> UiElement { UiElement(XCUIApplication().steppers) }
    func stepper(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().steppers) }
    func stepper(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().steppers) }

    func swittch() -> UiElement { UiElement(XCUIApplication().switches) }
    func swittch(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().switches) }
    func swittch(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().switches) }

    func tab() -> UiElement { UiElement(XCUIApplication().tabs) }
    func tab(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tabs) }
    func tab(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tabs) }

    func tabBar() -> UiElement { UiElement(XCUIApplication().tabBars) }
    func tabBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tabBars) }
    func tabBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tabBars) }

    func tabGroup() -> UiElement { UiElement(XCUIApplication().tabGroups) }
    func tabGroup(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tabGroups) }
    func tabGroup(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tabGroups) }

    func table() -> UiElement { UiElement(XCUIApplication().tables) }
    func table(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tables) }
    func table(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tables) }

    func tableColumn() -> UiElement { UiElement(XCUIApplication().tableColumns) }
    func tableColumn(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tableColumns) }
    func tableColumn(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tableColumns) }

    func tableRow() -> UiElement { UiElement(XCUIApplication().tableRows) }
    func tableRow(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().tableRows) }
    func tableRow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().tableRows) }

    func textField() -> UiElement { UiElement(XCUIApplication().textFields) }
    func textField(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().textFields) }
    func textField(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().textFields) }

    func textView() -> UiElement { UiElement(XCUIApplication().textViews) }
    func textView(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().textViews) }
    func textView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().textViews) }

    func timeline() -> UiElement { UiElement(XCUIApplication().timelines) }
    func timeline(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().timelines) }
    func timeline(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().timelines) }

    func toggle() -> UiElement { UiElement(XCUIApplication().toggles) }
    func toggle(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().toggles) }
    func toggle(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().toggles) }

    func toolbarButton() -> UiElement { UiElement(XCUIApplication().toolbarButtons) }
    func toolbarButton(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().toolbarButtons) }
    func toolbarButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().toolbarButtons) }

    func toolbar() -> UiElement { UiElement(XCUIApplication().toolbars) }
    func toolbar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().toolbars) }
    func toolbar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().toolbars) }

    func touchBar() -> UiElement { UiElement(XCUIApplication().touchBars) }
    func touchBar(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().touchBars) }
    func touchBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().touchBars) }

    func valueIndicator() -> UiElement { UiElement(XCUIApplication().valueIndicators) }
    func valueIndicator(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().valueIndicators) }
    func valueIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().valueIndicators) }

    func webView() -> UiElement { UiElement(XCUIApplication().webViews) }
    func webView(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().webViews) }
    func webView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().webViews) }

    func windows() -> UiElement { UiElement(XCUIApplication().windows) }
    func windows(_ identifier: String) -> UiElement { UiElement(identifier, XCUIApplication().windows) }
    func windows(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, XCUIApplication().windows) }
}
