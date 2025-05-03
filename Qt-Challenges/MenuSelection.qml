import QtQuick 2.12
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    id: root

    property alias item1: item1
    property alias item2: item2
    property alias item3: item3

    property real subtotal: item1.value + item2.value + item3.value

    header: Label{
        id: title
        text:  root.title
        font.pixelSize: 20
    }

    background: null

    ColumnLayout{
        MenuLabel{
            id: item1
        }

        MenuLabel{
            id: item2
        }

        MenuLabel{
            id: item3
        }
    }
}
