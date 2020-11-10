/*
 * Copyright (c) 2020 Meltytech, LLC
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

import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Rectangle {
    property int itemCount: 0 // should be provided by user
    property int itemHeight: 26

    function show(x, y) {
        menu.x = Math.max(0, Math.min(x, parent.width - menu.width))
        menu.y = Math.max(0, Math.min(y, parent.height - menu.height))
        if (!visible)
            visible = true
    }

    function hide() {
        visible = false
    }

    id: menu
    width: 100
    height: itemCount * itemHeight
    color: 'transparent'
    visible: false
    z: visible? 10 : 0

    SystemPalette { id: activePalette }
    Rectangle {
        id: background
        anchors.fill: parent
        color: activePalette.base
        border.color: '#333'
        border.width: application.OS !== 'OS X'? 1 : 0
    }
    DropShadow {
        source: background
        anchors.fill: background
        opacity: menu.opacity
        visible: application.OS !== 'Windows'
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8
        color: '#40000000'
        transparentBorder: true
        fast: true
    }
}
