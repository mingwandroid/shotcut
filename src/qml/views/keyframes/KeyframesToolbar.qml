/*
 * Copyright (c) 2016-2020 Meltytech, LLC
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2

ToolBar {
    property alias scaleSlider: scaleSlider

    SystemPalette { id: activePalette }

    id: toolBarRoot
    width: 200
    height: settings.smallIcons? 28 : hiddenButton.implicitHeight + 4

    RowLayout {
        y: 2

        ToolButton {
            id: hiddenButton
            visible: false
            implicitWidth: 32
            implicitHeight: 32
        }
        ToolButton {
            id: menuButton
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
            hoverEnabled: true
            ToolTip {
                visible: parent.hovered
                delay: 1000
                timeout: 5000
                text: qsTr('Display a menu of additional actions')
            }
            action: Action {
                id: menuAction
                icon.name: 'show-menu'
                icon.source: 'qrc:///icons/oxygen/32x32/actions/show-menu.png'
                onTriggered: menu.popup(menuButton.width / 2, toolBarRoot.height / 2)
            }
        }
        Button { // separator
            enabled: false
            implicitWidth: 2
            implicitHeight: settings.smallIcons? 14 : (hiddenButton.implicitHeight - 8)
        }
        ToolButton {
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
            hoverEnabled: true
            ToolTip {
                visible: parent.hovered
                delay: 1000
                timeout: 5000
                text: qsTr('Set the filter start')
            }
            action: Action {
                text: '['
                onTriggered: filter.in = producer.position + producer.in
            }
        }
        ToolButton {
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
            hoverEnabled: true
            ToolTip {
                visible: parent.hovered
                delay: 1000
                timeout: 5000
                text: qsTr('Set the filter end')
            }
            action: Action {
                text: ']'
                onTriggered: filter.out = producer.position + producer.in
            }
        }
        ToolButton {
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
            hoverEnabled: true
            ToolTip {
                visible: parent.hovered
                delay: 1000
                timeout: 5000
                text: qsTr('Set the first simple keyframe')
            }
            action: Action {
                text: '{'
                onTriggered: filter.animateIn = producer.position + producer.in - filter.in
            }
        }
        ToolButton {
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
            hoverEnabled: true
            ToolTip {
                visible: parent.hovered
                delay: 1000
                timeout: 5000
                text: qsTr('Set the second simple keyframe')
            }
            action: Action {
                text: '}'
                onTriggered: filter.animateOut = filter.out - (producer.position + producer.in)
            }
        }
        Button { // separator
            enabled: false
            implicitWidth: 2
            implicitHeight: settings.smallIcons? 14 : (hiddenButton.implicitHeight - 8)
        }
        ToolButton {
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
            hoverEnabled: true
            ToolTip {
                visible: parent.hovered
                delay: 1000
                timeout: 5000
                text: qsTr("Zoom keyframes out (Alt+-)")
            }
            action: Action {
                id: zoomOutAction
                icon.name: 'zoom-out'
                icon.source: 'qrc:///icons/oxygen/32x32/actions/zoom-out.png'
                onTriggered: root.zoomOut()
            }
        }
        ZoomSlider {
            id: scaleSlider
        }
        ToolButton {
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
            hoverEnabled: true
            ToolTip {
                visible: parent.hovered
                delay: 1000
                timeout: 5000
                text: qsTr("Zoom keyframes in (Alt++)")
            }
            action: Action {
                id: zoomInAction
                icon.name: 'zoom-in'
                icon.source: 'qrc:///icons/oxygen/32x32/actions/zoom-in.png'
                onTriggered: root.zoomIn()
            }
        }
        ToolButton {
            implicitWidth: settings.smallIcons? 18 : hiddenButton.implicitWidth
            implicitHeight: implicitWidth
            hoverEnabled: true
            ToolTip {
                visible: parent.hovered
                delay: 1000
                timeout: 5000
                text: qsTr('Zoom keyframes to fit (Alt+0)')
            }
            action: Action {
                id: zoomFitAction
                icon.name: 'zoom-fit-best'
                icon.source: 'qrc:///icons/oxygen/32x32/actions/zoom-fit-best.png'
                onTriggered: root.zoomToFit()
            }
        }
    }
}
