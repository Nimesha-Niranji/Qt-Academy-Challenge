import QtQuick 2.12
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    padding: 10
    background: null

    header: Label{
        text: qsTr("Climate Control")
        font.pixelSize: 48
        color: "White"
        padding: 10
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 10

        ZoneControls{
            id: zone1
            zoneName: qsTr("Zone 1")
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ZoneControls{
            id: zone2
            zoneName: qsTr("Zone 2")
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
