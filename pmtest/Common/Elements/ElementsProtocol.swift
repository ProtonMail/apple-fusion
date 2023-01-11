//
//  Elements.swift
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


private var app: XCUIApplication = XCUIApplication()

internal func getApp(bundleIdentifier: String? = nil) -> XCUIApplication {
    if let bundleIdentifier = bundleIdentifier {
        app = XCUIApplication(bundleIdentifier: bundleIdentifier)
    }
    return app
}

/**
 * Collection of all XCUIElement types that can be used in UI testing.
 */
public protocol ElementsProtocol {}

public extension ElementsProtocol {
    /**
     Specify which bundle to use when locating the element.
     */
    func inBundleIdentifier(_ bundleIdentifier: String? = nil) -> ElementsProtocol {
        app = getApp(bundleIdentifier: bundleIdentifier)
        return self
    }

    func activityIndicator() -> UiElement { UiElement(app.activityIndicators, XCUIElement.ElementType.activityIndicator) }
    func activityIndicator(_ identifier: String) -> UiElement { UiElement(identifier, app.activityIndicators, XCUIElement.ElementType.activityIndicator) }
    func activityIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.activityIndicators, XCUIElement.ElementType.activityIndicator) }

    func alert() -> UiElement { UiElement(app.alerts, XCUIElement.ElementType.alert) }
    func alert(_ identifier: String) -> UiElement { UiElement(identifier, app.alerts, XCUIElement.ElementType.alert) }
    func alert(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.alerts, XCUIElement.ElementType.alert) }

    func browser() -> UiElement { UiElement(app.browsers, XCUIElement.ElementType.browser) }
    func browser(_ identifier: String) -> UiElement { UiElement(identifier, app.browsers, XCUIElement.ElementType.browser) }
    func browser(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.browsers, XCUIElement.ElementType.browser) }

    func button() -> UiElement { UiElement(app.buttons, XCUIElement.ElementType.button) }
    func button(_ identifier: String) -> UiElement { UiElement(identifier, app.buttons, XCUIElement.ElementType.button) }
    func button(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.buttons, XCUIElement.ElementType.button) }

    func cell() -> UiElement { UiElement(app.cells, XCUIElement.ElementType.cell) }
    func cell(_ identifier: String) -> UiElement { UiElement(identifier, app.cells, XCUIElement.ElementType.cell) }
    func cell(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.cells, XCUIElement.ElementType.cell) }

    func checkBox() -> UiElement { UiElement(app.checkBoxes, XCUIElement.ElementType.checkBox) }
    func checkBox(_ identifier: String) -> UiElement { UiElement(identifier, app.checkBoxes, XCUIElement.ElementType.checkBox) }
    func checkBox(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.checkBoxes, XCUIElement.ElementType.checkBox) }

    func collectionView() -> UiElement { UiElement(app.collectionViews, XCUIElement.ElementType.collectionView) }
    func collectionView(_ identifier: String) -> UiElement { UiElement(identifier, app.collectionViews, XCUIElement.ElementType.collectionView) }
    func collectionView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.collectionViews, XCUIElement.ElementType.collectionView) }

    func colorWell() -> UiElement { UiElement(app.colorWells, XCUIElement.ElementType.colorWell) }
    func colorWell(_ identifier: String) -> UiElement { UiElement(identifier, app.colorWells, XCUIElement.ElementType.colorWell) }
    func colorWell(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.colorWells, XCUIElement.ElementType.colorWell) }

    func comboBox() -> UiElement { UiElement(app.comboBoxes, XCUIElement.ElementType.comboBox) }
    func comboBox(_ identifier: String) -> UiElement { UiElement(identifier, app.comboBoxes, XCUIElement.ElementType.comboBox) }
    func comboBox(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.comboBoxes, XCUIElement.ElementType.comboBox) }

    func datePicker() -> UiElement { UiElement(app.datePickers, XCUIElement.ElementType.datePicker) }
    func datePicker(_ identifier: String) -> UiElement { UiElement(identifier, app.datePickers, XCUIElement.ElementType.datePicker) }
    func datePicker(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.datePickers, XCUIElement.ElementType.datePicker) }

    func decrementArrow() -> UiElement { UiElement(app.decrementArrows, XCUIElement.ElementType.decrementArrow) }
    func decrementArrow(_ identifier: String) -> UiElement { UiElement(identifier, app.decrementArrows, XCUIElement.ElementType.decrementArrow) }
    func decrementArrow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.decrementArrows, XCUIElement.ElementType.decrementArrow) }

    func dialog() -> UiElement { UiElement(app.dialogs, XCUIElement.ElementType.dialog) }
    func dialog(_ identifier: String) -> UiElement { UiElement(identifier, app.dialogs, XCUIElement.ElementType.dialog) }
    func dialog(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.dialogs, XCUIElement.ElementType.dialog) }

    func disclosureTriangle() -> UiElement { UiElement(app.disclosureTriangles, XCUIElement.ElementType.disclosureTriangle) }
    func disclosureTriangle(_ identifier: String) -> UiElement { UiElement(identifier, app.disclosureTriangles, XCUIElement.ElementType.disclosureTriangle) }
    func disclosureTriangle(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.disclosureTriangles, XCUIElement.ElementType.disclosureTriangle) }

    func dockItem() -> UiElement { UiElement(app.dockItems, XCUIElement.ElementType.dockItem) }
    func dockItem(_ identifier: String) -> UiElement { UiElement(identifier, app.dockItems, XCUIElement.ElementType.dockItem) }
    func dockItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.dockItems, XCUIElement.ElementType.dockItem) }

    func drawer() -> UiElement { UiElement(app.drawers, XCUIElement.ElementType.drawer) }
    func drawer(_ identifier: String) -> UiElement { UiElement(identifier, app.drawers, XCUIElement.ElementType.drawer) }
    func drawer(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.drawers, XCUIElement.ElementType.drawer) }

    func grid() -> UiElement { UiElement(app.grids, XCUIElement.ElementType.grid) }
    func grid(_ identifier: String) -> UiElement { UiElement(identifier, app.grids, XCUIElement.ElementType.grid) }
    func grid(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.grids, XCUIElement.ElementType.grid) }

    func group() -> UiElement { UiElement(app.groups, XCUIElement.ElementType.group) }
    func group(_ identifier: String) -> UiElement { UiElement(identifier, app.groups, XCUIElement.ElementType.group) }
    func group(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.groups, XCUIElement.ElementType.group) }

    func handle() -> UiElement { UiElement(app.handles, XCUIElement.ElementType.handle) }
    func handle(_ identifier: String) -> UiElement { UiElement(identifier, app.handles, XCUIElement.ElementType.handle) }
    func handle(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.handles, XCUIElement.ElementType.handle) }

    func helpTag() -> UiElement { UiElement(app.helpTags, XCUIElement.ElementType.helpTag) }
    func helpTag(_ identifier: String) -> UiElement { UiElement(identifier, app.helpTags, XCUIElement.ElementType.helpTag) }
    func helpTag(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.helpTags, XCUIElement.ElementType.helpTag) }

    func icon() -> UiElement { UiElement(app.icons, XCUIElement.ElementType.icon) }
    func icon(_ identifier: String) -> UiElement { UiElement(identifier, app.icons, XCUIElement.ElementType.icon) }
    func icon(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.icons, XCUIElement.ElementType.icon) }

    func image() -> UiElement { UiElement(app.images, XCUIElement.ElementType.image) }
    func image(_ identifier: String) -> UiElement { UiElement(identifier, app.images, XCUIElement.ElementType.image) }
    func image(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.images, XCUIElement.ElementType.image) }

    func incrementArrow() -> UiElement { UiElement(app.incrementArrows, XCUIElement.ElementType.incrementArrow) }
    func incrementArrow(_ identifier: String) -> UiElement { UiElement(identifier, app.incrementArrows, XCUIElement.ElementType.incrementArrow) }
    func incrementArrow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.incrementArrows, XCUIElement.ElementType.incrementArrow) }

    func keyboard() -> UiElement { UiElement(app.keyboards, XCUIElement.ElementType.keyboard) }
    func keyboard(_ identifier: String) -> UiElement { UiElement(identifier, app.keyboards, XCUIElement.ElementType.keyboard) }
    func keyboard(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.keyboards, XCUIElement.ElementType.keyboard) }

    func key() -> UiElement { UiElement(app.keys, XCUIElement.ElementType.key) }
    func key(_ identifier: String) -> UiElement { UiElement(identifier, app.keys, XCUIElement.ElementType.key) }
    func key(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.keys, XCUIElement.ElementType.key) }

    func layoutArea() -> UiElement { UiElement(app.layoutAreas, XCUIElement.ElementType.layoutArea) }
    func layoutArea(_ identifier: String) -> UiElement { UiElement(identifier, app.layoutAreas, XCUIElement.ElementType.layoutArea) }
    func layoutArea(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.layoutAreas, XCUIElement.ElementType.layoutArea) }

    func layoutItem() -> UiElement { UiElement(app.layoutItems, XCUIElement.ElementType.layoutItem) }
    func layoutItem(_ identifier: String) -> UiElement { UiElement(identifier, app.layoutItems, XCUIElement.ElementType.layoutItem) }
    func layoutItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.layoutItems, XCUIElement.ElementType.layoutItem) }

    func levelIndicator() -> UiElement { UiElement(app.levelIndicators, XCUIElement.ElementType.levelIndicator) }
    func levelIndicator(_ identifier: String) -> UiElement { UiElement(identifier, app.levelIndicators, XCUIElement.ElementType.levelIndicator) }
    func levelIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.levelIndicators, XCUIElement.ElementType.levelIndicator) }

    func link() -> UiElement { UiElement(app.links, XCUIElement.ElementType.link) }
    func link(_ identifier: String) -> UiElement { UiElement(identifier, app.links, XCUIElement.ElementType.link) }
    func link(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.links, XCUIElement.ElementType.link) }

    func map() -> UiElement { UiElement(app.maps, XCUIElement.ElementType.map) }
    func map(_ identifier: String) -> UiElement { UiElement(identifier, app.maps, XCUIElement.ElementType.map) }
    func map(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.maps, XCUIElement.ElementType.map) }

    func matte() -> UiElement { UiElement(app.mattes, XCUIElement.ElementType.matte) }
    func matte(_ identifier: String) -> UiElement { UiElement(identifier, app.mattes, XCUIElement.ElementType.matte) }
    func matte(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.mattes, XCUIElement.ElementType.matte) }

    func menuBar() -> UiElement { UiElement(app.menuBars, XCUIElement.ElementType.menuBar) }
    func menuBar(_ identifier: String) -> UiElement { UiElement(identifier, app.menuBars, XCUIElement.ElementType.menuBar) }
    func menuBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.menuBars, XCUIElement.ElementType.menuBar) }

    func menuBarItem() -> UiElement { UiElement(app.menuBarItems, XCUIElement.ElementType.menuBarItem) }
    func menuBarItem(_ identifier: String) -> UiElement { UiElement(identifier, app.menuBarItems, XCUIElement.ElementType.menuBarItem) }
    func menuBarItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.menuBarItems, XCUIElement.ElementType.menuBarItem) }

    func menuButton() -> UiElement { UiElement(app.menuButtons, XCUIElement.ElementType.menuButton) }
    func menuButton(_ identifier: String) -> UiElement { UiElement(identifier, app.menuButtons, XCUIElement.ElementType.menuButton) }
    func menuButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.menuButtons, XCUIElement.ElementType.menuButton) }

    func menuItem() -> UiElement { UiElement(app.menuItems, XCUIElement.ElementType.menuItem) }
    func menuItem(_ identifier: String) -> UiElement { UiElement(identifier, app.menuItems, XCUIElement.ElementType.menuItem) }
    func menuItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.menuItems, XCUIElement.ElementType.menuItem) }

    func menu() -> UiElement { UiElement(app.menus, XCUIElement.ElementType.menu) }
    func menu(_ identifier: String) -> UiElement { UiElement(identifier, app.menus, XCUIElement.ElementType.menu) }
    func menu(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.menus, XCUIElement.ElementType.menu) }

    func navigationBar() -> UiElement { UiElement(app.navigationBars, XCUIElement.ElementType.navigationBar) }
    func navigationBar(_ identifier: String) -> UiElement { UiElement(identifier, app.navigationBars, XCUIElement.ElementType.navigationBar) }
    func navigationBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.navigationBars, XCUIElement.ElementType.navigationBar) }

    func otherElement() -> UiElement { UiElement(app.otherElements, XCUIElement.ElementType.other) }
    func otherElement(_ identifier: String) -> UiElement { UiElement(identifier, app.otherElements, XCUIElement.ElementType.other) }
    func otherElement(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.otherElements, XCUIElement.ElementType.other) }

    func outline() -> UiElement { UiElement(app.outlines, XCUIElement.ElementType.outline) }
    func outline(_ identifier: String) -> UiElement { UiElement(identifier, app.outlines, XCUIElement.ElementType.outline) }
    func outline(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.outlines, XCUIElement.ElementType.outline) }

    func outlineRow() -> UiElement { UiElement(app.outlineRows, XCUIElement.ElementType.outlineRow) }
    func outlineRow(_ identifier: String) -> UiElement { UiElement(identifier, app.outlineRows, XCUIElement.ElementType.outlineRow) }
    func outlineRow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.outlineRows, XCUIElement.ElementType.outlineRow) }

    func pageIndicator() -> UiElement { UiElement(app.pageIndicators, XCUIElement.ElementType.pageIndicator) }
    func pageIndicator(_ identifier: String) -> UiElement { UiElement(identifier, app.pageIndicators, XCUIElement.ElementType.pageIndicator) }
    func pageIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.pageIndicators, XCUIElement.ElementType.pageIndicator) }

    func picker() -> UiElement { UiElement(app.pickers, XCUIElement.ElementType.picker) }
    func picker(_ identifier: String) -> UiElement { UiElement(identifier, app.pickers, XCUIElement.ElementType.picker) }
    func picker(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.pickers, XCUIElement.ElementType.picker) }

    func pickerWheel() -> UiElement { UiElement(app.pickerWheels, XCUIElement.ElementType.pickerWheel) }
    func pickerWheel(_ identifier: String) -> UiElement { UiElement(identifier, app.pickerWheels, XCUIElement.ElementType.pickerWheel) }
    func pickerWheel(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.pickerWheels, XCUIElement.ElementType.pickerWheel) }

    func popover() -> UiElement { UiElement(app.popovers, XCUIElement.ElementType.popover) }
    func popover(_ identifier: String) -> UiElement { UiElement(identifier, app.popovers, XCUIElement.ElementType.popover) }
    func popover(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.popovers, XCUIElement.ElementType.popover) }

    func popUpButton() -> UiElement { UiElement(app.popUpButtons, XCUIElement.ElementType.popUpButton) }
    func popUpButton(_ identifier: String) -> UiElement { UiElement(identifier, app.popUpButtons, XCUIElement.ElementType.popUpButton) }
    func popUpButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.popUpButtons, XCUIElement.ElementType.popUpButton) }

    func progressIndicator() -> UiElement { UiElement(app.progressIndicators, XCUIElement.ElementType.progressIndicator) }
    func progressIndicator(_ identifier: String) -> UiElement { UiElement(identifier, app.progressIndicators, XCUIElement.ElementType.progressIndicator) }
    func progressIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.progressIndicators, XCUIElement.ElementType.progressIndicator) }

    func radioButton() -> UiElement { UiElement(app.radioButtons, XCUIElement.ElementType.radioButton) }
    func radioButton(_ identifier: String) -> UiElement { UiElement(identifier, app.radioButtons, XCUIElement.ElementType.radioButton) }
    func radioButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.radioButtons, XCUIElement.ElementType.radioButton) }

    func radioGroup() -> UiElement { UiElement(app.radioGroups, XCUIElement.ElementType.radioGroup) }
    func radioGroup(_ identifier: String) -> UiElement { UiElement(identifier, app.radioGroups, XCUIElement.ElementType.radioGroup) }
    func radioGroup(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.radioGroups, XCUIElement.ElementType.radioGroup) }

    func ratingIndicator() -> UiElement { UiElement(app.ratingIndicators, XCUIElement.ElementType.ratingIndicator) }
    func ratingIndicator(_ identifier: String) -> UiElement { UiElement(identifier, app.ratingIndicators, XCUIElement.ElementType.ratingIndicator) }
    func ratingIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.ratingIndicators, XCUIElement.ElementType.ratingIndicator) }

    func relevanceIndicator() -> UiElement { UiElement(app.relevanceIndicators, XCUIElement.ElementType.relevanceIndicator) }
    func relevanceIndicator(_ identifier: String) -> UiElement { UiElement(identifier, app.relevanceIndicators, XCUIElement.ElementType.relevanceIndicator) }
    func relevanceIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.relevanceIndicators, XCUIElement.ElementType.relevanceIndicator) }

    func rulerMarker() -> UiElement { UiElement(app.rulerMarkers, XCUIElement.ElementType.rulerMarker) }
    func rulerMarker(_ identifier: String) -> UiElement { UiElement(identifier, app.rulerMarkers, XCUIElement.ElementType.rulerMarker) }
    func rulerMarker(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.rulerMarkers, XCUIElement.ElementType.rulerMarker) }

    func ruler() -> UiElement { UiElement(app.rulers, XCUIElement.ElementType.ruler) }
    func ruler(_ identifier: String) -> UiElement { UiElement(identifier, app.rulers, XCUIElement.ElementType.ruler) }
    func ruler(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.rulers, XCUIElement.ElementType.ruler) }

    func scrollBar() -> UiElement { UiElement(app.scrollBars, XCUIElement.ElementType.scrollBar) }
    func scrollBar(_ identifier: String) -> UiElement { UiElement(identifier, app.scrollBars, XCUIElement.ElementType.scrollBar) }
    func scrollBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.scrollBars, XCUIElement.ElementType.scrollBar) }

    func scrollView() -> UiElement { UiElement(app.scrollViews, XCUIElement.ElementType.scrollView) }
    func scrollView(_ identifier: String) -> UiElement { UiElement(identifier, app.scrollViews, XCUIElement.ElementType.scrollView) }
    func scrollView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.scrollViews, XCUIElement.ElementType.scrollView) }

    func searchField() -> UiElement { UiElement(app.searchFields, XCUIElement.ElementType.searchField) }
    func searchField(_ identifier: String) -> UiElement { UiElement(identifier, app.searchFields, XCUIElement.ElementType.searchField) }
    func searchField(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.searchFields, XCUIElement.ElementType.searchField) }

    func secureTextField() -> UiElement { UiElement(app.secureTextFields, XCUIElement.ElementType.secureTextField) }
    func secureTextField(_ identifier: String) -> UiElement { UiElement(identifier, app.secureTextFields, XCUIElement.ElementType.secureTextField) }
    func secureTextField(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.secureTextFields, XCUIElement.ElementType.secureTextField) }

    func segmentedControl() -> UiElement { UiElement(app.segmentedControls, XCUIElement.ElementType.segmentedControl) }
    func segmentedControl(_ identifier: String) -> UiElement { UiElement(identifier, app.segmentedControls, XCUIElement.ElementType.segmentedControl) }
    func segmentedControl(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.segmentedControls, XCUIElement.ElementType.segmentedControl) }

    func sheet() -> UiElement { UiElement(app.sheets, XCUIElement.ElementType.sheet) }
    func sheet(_ identifier: String) -> UiElement { UiElement(identifier, app.sheets, XCUIElement.ElementType.sheet) }
    func sheet(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.sheets, XCUIElement.ElementType.sheet) }

    func slider() -> UiElement { UiElement(app.sliders, XCUIElement.ElementType.slider) }
    func slider(_ identifier: String) -> UiElement { UiElement(identifier, app.sliders, XCUIElement.ElementType.slider) }
    func slider(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.sliders, XCUIElement.ElementType.slider) }

    func splitGroup() -> UiElement { UiElement(app.splitGroups, XCUIElement.ElementType.splitGroup) }
    func splitGroup(_ identifier: String) -> UiElement { UiElement(identifier, app.splitGroups, XCUIElement.ElementType.splitGroup) }
    func splitGroup(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.splitGroups, XCUIElement.ElementType.splitGroup) }

    func splitter() -> UiElement { UiElement(app.splitters, XCUIElement.ElementType.splitter) }
    func splitter(_ identifier: String) -> UiElement { UiElement(identifier, app.splitters, XCUIElement.ElementType.splitter) }
    func splitter(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.splitters, XCUIElement.ElementType.splitter) }

    func staticText() -> UiElement { UiElement(app.staticTexts, XCUIElement.ElementType.staticText) }
    func staticText(_ identifier: String) -> UiElement { UiElement(identifier, app.staticTexts, XCUIElement.ElementType.staticText) }
    func staticText(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.staticTexts, XCUIElement.ElementType.staticText) }

    func statusBar() -> UiElement { UiElement(app.statusBars, XCUIElement.ElementType.statusBar) }
    func statusBar(_ identifier: String) -> UiElement { UiElement(identifier, app.statusBars, XCUIElement.ElementType.statusBar) }
    func statusBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.statusBars, XCUIElement.ElementType.statusBar) }

    func statusItem() -> UiElement { UiElement(app.statusItems, XCUIElement.ElementType.statusItem) }
    func statusItem(_ identifier: String) -> UiElement { UiElement(identifier, app.statusItems, XCUIElement.ElementType.statusItem) }
    func statusItem(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.statusItems, XCUIElement.ElementType.statusItem) }

    func stepper() -> UiElement { UiElement(app.steppers, XCUIElement.ElementType.stepper) }
    func stepper(_ identifier: String) -> UiElement { UiElement(identifier, app.steppers, XCUIElement.ElementType.stepper) }
    func stepper(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.steppers, XCUIElement.ElementType.stepper) }

    func swittch() -> UiElement { UiElement(app.switches, XCUIElement.ElementType.switch) }
    func swittch(_ identifier: String) -> UiElement { UiElement(identifier, app.switches, XCUIElement.ElementType.switch) }
    func swittch(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.switches, XCUIElement.ElementType.switch) }

    func tab() -> UiElement { UiElement(app.tabs, XCUIElement.ElementType.tab) }
    func tab(_ identifier: String) -> UiElement { UiElement(identifier, app.tabs, XCUIElement.ElementType.tab) }
    func tab(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.tabs, XCUIElement.ElementType.tab) }

    func tabBar() -> UiElement { UiElement(app.tabBars, XCUIElement.ElementType.tabBar) }
    func tabBar(_ identifier: String) -> UiElement { UiElement(identifier, app.tabBars, XCUIElement.ElementType.tabBar) }
    func tabBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.tabBars, XCUIElement.ElementType.tabBar) }

    func tabGroup() -> UiElement { UiElement(app.tabGroups, XCUIElement.ElementType.tabGroup) }
    func tabGroup(_ identifier: String) -> UiElement { UiElement(identifier, app.tabGroups, XCUIElement.ElementType.tabGroup) }
    func tabGroup(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.tabGroups, XCUIElement.ElementType.tabGroup) }

    func table() -> UiElement { UiElement(app.tables, XCUIElement.ElementType.table) }
    func table(_ identifier: String) -> UiElement { UiElement(identifier, app.tables, XCUIElement.ElementType.table) }
    func table(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.tables, XCUIElement.ElementType.table) }

    func tableColumn() -> UiElement { UiElement(app.tableColumns, XCUIElement.ElementType.tableColumn) }
    func tableColumn(_ identifier: String) -> UiElement { UiElement(identifier, app.tableColumns, XCUIElement.ElementType.tableColumn) }
    func tableColumn(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.tableColumns, XCUIElement.ElementType.tableColumn) }

    func tableRow() -> UiElement { UiElement(app.tableRows, XCUIElement.ElementType.tableRow) }
    func tableRow(_ identifier: String) -> UiElement { UiElement(identifier, app.tableRows, XCUIElement.ElementType.tableRow) }
    func tableRow(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.tableRows, XCUIElement.ElementType.tableRow) }

    func textField() -> UiElement { UiElement(app.textFields, XCUIElement.ElementType.textField) }
    func textField(_ identifier: String) -> UiElement { UiElement(identifier, app.textFields, XCUIElement.ElementType.textField) }
    func textField(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.textFields, XCUIElement.ElementType.textField) }

    func textView() -> UiElement { UiElement(app.textViews, XCUIElement.ElementType.textView) }
    func textView(_ identifier: String) -> UiElement { UiElement(identifier, app.textViews, XCUIElement.ElementType.textView) }
    func textView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.textViews, XCUIElement.ElementType.textView) }

    func timeline() -> UiElement { UiElement(app.timelines, XCUIElement.ElementType.timeline) }
    func timeline(_ identifier: String) -> UiElement { UiElement(identifier, app.timelines, XCUIElement.ElementType.timeline) }
    func timeline(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.timelines, XCUIElement.ElementType.timeline) }

    func toggle() -> UiElement { UiElement(app.toggles, XCUIElement.ElementType.toggle) }
    func toggle(_ identifier: String) -> UiElement { UiElement(identifier, app.toggles, XCUIElement.ElementType.toggle) }
    func toggle(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.toggles, XCUIElement.ElementType.toggle) }

    func toolbarButton() -> UiElement { UiElement(app.toolbarButtons, XCUIElement.ElementType.toolbarButton) }
    func toolbarButton(_ identifier: String) -> UiElement { UiElement(identifier, app.toolbarButtons, XCUIElement.ElementType.toolbarButton) }
    func toolbarButton(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.toolbarButtons, XCUIElement.ElementType.toolbarButton) }

    func toolbar() -> UiElement { UiElement(app.toolbars, XCUIElement.ElementType.toolbar) }
    func toolbar(_ identifier: String) -> UiElement { UiElement(identifier, app.toolbars, XCUIElement.ElementType.toolbar) }
    func toolbar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.toolbars, XCUIElement.ElementType.toolbar) }

    func touchBar() -> UiElement { UiElement(app.touchBars, XCUIElement.ElementType.touchBar) }
    func touchBar(_ identifier: String) -> UiElement { UiElement(identifier, app.touchBars, XCUIElement.ElementType.touchBar) }
    func touchBar(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.touchBars, XCUIElement.ElementType.touchBar) }

    func valueIndicator() -> UiElement { UiElement(app.valueIndicators, XCUIElement.ElementType.valueIndicator) }
    func valueIndicator(_ identifier: String) -> UiElement { UiElement(identifier, app.valueIndicators, XCUIElement.ElementType.valueIndicator) }
    func valueIndicator(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.valueIndicators, XCUIElement.ElementType.valueIndicator) }

    func webView() -> UiElement { UiElement(app.webViews, XCUIElement.ElementType.webView) }
    func webView(_ identifier: String) -> UiElement { UiElement(identifier, app.webViews, XCUIElement.ElementType.webView) }
    func webView(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.webViews, XCUIElement.ElementType.webView) }

    func windows() -> UiElement { UiElement(app.windows, XCUIElement.ElementType.window) }
    func windows(_ identifier: String) -> UiElement { UiElement(identifier, app.windows, XCUIElement.ElementType.window) }
    func windows(_ predicate: NSPredicate) -> UiElement { UiElement(predicate, app.windows, XCUIElement.ElementType.window) }
}
