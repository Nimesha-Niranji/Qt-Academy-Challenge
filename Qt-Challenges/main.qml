import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    width: 850
    height: 850
    visible: true
    title: qsTr("Business card")

    Rectangle {
        id: rectangle1
        width: root.width * 0.5
        height: root.height * 0.5
        color: "red"

    }

    Rectangle {
        id: rectangle2
        width: root.width * 0.5
        height: root.height * 0.5
        color: "green"
        anchors.right: parent.right

    }
    Rectangle {
        id: rectangle3
        width: root.width * 0.5
        height: root.height * 0.5
        color: "pink"
        anchors.bottom: parent.bottom

    }

    Rectangle {
        id: rectangle4
        width: root.width * 0.5
        height: root.height * 0.5
        color: "blue"
        anchors.right: parent.right
        anchors.bottom: parent.bottom

    }
}
