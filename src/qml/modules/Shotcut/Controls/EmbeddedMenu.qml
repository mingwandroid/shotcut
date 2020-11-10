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
    property int itemHeight: 26

    function visible() {
        return menu.state === 'visible'
    }

    function show(x, y) {
        menu.x = Math.min(x, parent.width - menu.width)
        menu.y = Math.min(y, parent.height - menu.height)
        if (!visible())
            menu.state = 'visible'
    }

    function hide() {
        menu.state = 'invisible'
        menu.opacity = 0
    }

    id: menu
    width: 100
    height: menuLayout.children.length * itemHeight
    color: 'transparent'
    opacity: 0
    states: [
        State { name: 'invisible'; PropertyChanges { target: menu; opacity: 0; z: 0} },
        State { name: 'visible'; PropertyChanges { target: menu; opacity: 1; z: 10} }
    ]
    state: 'invisible'

    SystemPalette { id: activePalette }
    Rectangle {
        id: background
        anchors.fill: parent
        color: activePalette.base
    }

    DropShadow {
        source: background
        anchors.fill: background
        opacity: menu.opacity
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8
        color: '#40000000'
        transparentBorder: true
        fast: true
    }
}
