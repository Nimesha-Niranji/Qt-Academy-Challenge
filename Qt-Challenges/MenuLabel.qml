import QtQuick 2.12
import QtQuick.Controls.Basic
import QtQuick.Layouts

RowLayout {
    id: menuItem

    property string name
    property real cost: 0
    readonly property real value: spinBox.value*cost

    Label{
        id: label
        text:  `${menuItem.name}: $${menuItem.cost}`
        Layout.fillWidth: true
    }

    SpinBox{
        id: spinBox
    }
}
