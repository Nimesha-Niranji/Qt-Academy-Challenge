import QtQuick 2.12
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {
    id: root

    property string  zoneName
    property int  celsius: temperatureDial.value
    property int fahrenheit: (celsius*1.8)+36

    padding: 20

    background: Rectangle{
        color: "Black"
        opacity: 0.5
    }

    readonly property color temperatureColor: {
        if(celsius < 10)
            return Qt.color("lightblue")
        else if(celsius>=10 && celsius<20)
            return Qt.color("cyan")
        else if(celsius>=20 && celsius<30)
            return Qt.color("orange")
        else
            return Qt.color("red")
    }

    palette{
        windowText: root.temperatureColor
        dark: root.temperatureColor
    }

    RowLayout{
        spacing: 10
        anchors.fill: parent

        ColumnLayout{
            id: leftColumn
            spacing: 10

            RowLayout{
                spacing: 10

                CheckBox{
                    id: zoneEnableCheckBox
                    checked: true
                    text: qsTr("Enable %1").arg(root.zoneName)
                }

                Switch{
                    id:unitSwitch
                    text: qsTr("ºC / ºF")
                }
            }

            RowLayout{
                spacing: 10
                enabled: zoneEnableCheckBox.checked

                Image{
                    source: Qt.resolvedUrl("qrc:/Assets/hc/cool.svg")
                    Layout.alignment: Qt.AlignBottom
                }

                Dial {
                    id: temperatureDial
                    from: 0
                    to: 40
                    stepSize: 1
                    snapMode: Dial.SnapAlways
                    value: 21 //default value
                }

                Image{
                    source: Qt.resolvedUrl("qrc:/Assets/hc/heat.svg")
                    Layout.alignment: Qt.AlignBottom
                }
            }
        }

        ColumnLayout{
            id: rightColumn
            spacing: 10
            enabled: zoneEnableCheckBox.checked

            Label{
                text: unitSwitch.checked ? fahrenheit + ("ºF") : celsius + ("ºC")

                font{
                    pixelSize: 200
                    weight: font.ExtraLight
                }

                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignRight

                // improve text appearance at the cost of increased memory usage
                //renderTypeQuality: Text.HighRenderTypeQuality

                //optimizing for both appearance and reduced graphics memory consumption
                renderType: Text.CurveRendering
            }

            RowLayout{
                spacing: 10

                Image{
                    source: fanSpeedSlider.value > 0 ?
                                Qt.resolvedUrl("qrc:/Assets/hc/fan_outline.svg") :
                                Qt.resolvedUrl("qrc:/Assets/hc/fan_off.svg")
                    scale: 0.75
                }

                Slider{
                    id: fanSpeedSlider
                    from: 0
                    to: 100
                    Layout.fillWidth: true
                }

                Image{
                    source: Qt.resolvedUrl("qrc:/Assets/hc/fan_fill.svg")
                    scale: 1.25
                }
            }
        }
    }
}
