import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls

Window {
    id: root
    width: 640
    height: 360
    visible: true
    title: qsTr("Business card")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: businessCardPage
    }

    component ContactInfo: QtObject {
        property string name
        //property url photo
        property string occupation
        property string company
        property string address
        property string country
        property string phone
        property string email
        property url webSite
    }

    ContactInfo {
        id: myContactInfor
        name: "Nimesha Niranji"
        //photo: Qt.resolvedUrl("IDPhoto.png")
        occupation: "Software Engineer"
        company: "Dr Paw"
        address: "Alawwa Kurunegala"
        country: "Sri Lanka"
        phone: "+94710522031"
        email: "niranjikgn25@gmail.com"
        webSite: Qt.url("https://www.qt.io")
    }

    Component{
        id: businessCardPage

        Rectangle {
            id: rectangle1
            color: "white"

            Rectangle {
                id: boarderRectangle
                width: rectangle1.width
                height: width / 1.586
                color: "transparent"
                border.color: "black"
                border.width: 2
                radius: 10

                anchors {
                    fill: parent
                    margins: 10
                }

                Item {
                    id: boarderItem
                    anchors.fill: parent
                    anchors.margins: boarderRectangle.radius

                    Rectangle {
                        id: photoFrame
                        width: 150
                        height: width
                        color: "transparent"
                        border.color: "black"
                        border.width: 2
                        radius: 5
                        anchors.right: parent.right
                        Image {
                            id: idPhoto
                            source: "qrc:/Image/id.jfif"
                            anchors.fill: parent
                            anchors.margins: photoFrame.radius
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                    Text {
                        id: nameText
                        text: myContactInfor.name
                        font {
                            pixelSize: 40
                            weight: Font.Bold
                            capitalization: "AllUppercase"
                        }
                    }

                    Item {
                        id: basicInfo
                        visible: !detailsButton.checked
                        anchors {
                            top: nameText.bottom
                            topMargin: 10
                            left: parent.left
                            right: parent.right
                            bottom: parent.bottom
                        }

                        Text {
                            id: occupationtext
                            text: myContactInfor.occupation
                            font.pixelSize: 25
                        }
                        Text {
                            id: companyText
                            text: myContactInfor.company
                            font.pixelSize: 25
                            anchors.top: occupationtext.bottom
                            anchors.topMargin: 10
                        }
                    }

                    Item {
                        id: detailInfo
                        visible: detailsButton.checked

                        anchors {
                            top: nameText.bottom
                            topMargin: 10
                            left: parent.left
                            right: parent.right
                            bottom: parent.bottom
                        }
                        Text {
                            id: addresstext
                            text: myContactInfor.address
                            font.pixelSize: 25
                        }
                        Text {
                            id: countryText
                            text: myContactInfor.country
                            font.pixelSize: 25
                            anchors {
                                top: addresstext.bottom
                                topMargin: 10
                            }
                        }
                        Text {
                            id: phoneText
                            text: myContactInfor.phone
                            font.pixelSize: 25
                            anchors {
                                top: countryText.bottom
                                topMargin: 10
                            }
                        }
                        Text {
                            id: emailText
                            text: myContactInfor.email
                            font.pixelSize: 25
                            anchors {
                                top: phoneText.bottom
                                topMargin: 10
                            }
                        }
                        Text {
                            id: urtText
                            text: myContactInfor.webSite
                            font.pixelSize: 25
                            anchors {
                                top: emailText.bottom
                                topMargin: 10
                            }
                        }
                    }

                    Rectangle {

                        property bool checked: false
                        property bool checkable: true
                        signal clicked
                        id: detailsButton
                        width: 120
                        height: 40
                        border.color: "Black"
                        border.width: 1.75
                        radius: height / 2
                        anchors.bottom: parent.bottom

                        color: detailsButton.checked
                               || tapHandler.pressed ? "white" : "black"

                        //border.color: detailsButton.checked || tapHandler.pressed ? "black" : "white"
                        Text {
                            id: detailText
                            text: "Details"
                            font.pixelSize: 17
                            anchors.centerIn: parent
                            color: detailsButton.checked
                                   || tapHandler.pressed ? "black" : "white"
                        }

                        TapHandler {
                            id: tapHandler

                            onTapped: {
                                if (detailsButton.checkable) {
                                    detailsButton.checked = !detailsButton.checked
                                }

                                detailsButton.clicked()
                            }
                        }
                    }
                }
            }

            Button {
                text: "Next"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    root.title = qsTr("Guitar Pedal")    // <- Change title
                    root.minimumWidth = 260                         // <- Change width
                    root.minimumHeight = 380                        // <- Change height
                    root.maximumWidth = minimumWidth
                    root.maximumHeight = minimumHeight
                    stackView.push(guitarPedalPage)
                }
            }
        }

    }

    Component{
        //Guitar Pedal application
        id:guitarPedalPage

        Rectangle{
            id: rectangle2
            color: "pink"

            FontLoader{
                id: russoFontLoader
                source: ":/Fonts/RussoOne-Regular.ttf"
            }

            FontLoader{
                id: prismaFontLoader
                source: ":/Fonts/Prisma.ttf"
            }

            Image{
                id: backgroundImage
                source: "qrc:/Assets/Guitar-Pedal-Background.png"
                anchors.fill: parent
            }

            Item{
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.topMargin: 17
                anchors.bottomMargin: 17

                component ScrewImage: Image{
                    source: "qrc:/Assets/Screw.png"
                }

                ScrewImage {
                    anchors.top: parent.top
                    anchors.left: parent.left
                }

                ScrewImage {
                    anchors.top: parent.top
                    anchors.right: parent.right
                }

                ScrewImage {
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                }

                ScrewImage {
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                }

                component DeviceText: Text{
                    color: "Black"
                    font.family: russoFontLoader.font.family
                    font.weight: russoFontLoader.font.weight
                    font.pixelSize: 9
                }

                component Infortext: Column{
                    id: infoLabel
                    spacing: 5

                    property alias text: label.text
                    property alias font: label.font
                    property int linewidth: 200
                    property int lineheight: 2
                    property color linecolor: "Black"
                    // anchors.top: parent.verticalCenter
                    // anchors.horizontalCenter: parent.horizontalCenter
                    // anchors.topMargin: 16

                    Rectangle{
                        height: infoLabel.lineheight
                        width: infoLabel.linewidth
                        color: infoLabel.linecolor
                    }

                    DeviceText {
                        id: label
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle{
                        height: infoLabel.lineheight
                        width: infoLabel.linewidth
                        color: infoLabel.linecolor
                    }
                }

                Infortext{
                    text: qsTr("TIME BLENDER")
                    anchors.top: parent.verticalCenter
                    anchors.topMargin: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    font.family: russoFontLoader.font.family
                    font.pixelSize: 18
                }

                Infortext{
                    text: qsTr("IN")
                    anchors.top: parent.top
                    anchors.topMargin: 60
                    anchors.left: parent.left
                    linewidth: 30
                    lineheight: 2
                }

                Infortext{
                    text: qsTr("OUT")
                    anchors.top: parent.top
                    anchors.topMargin: 60
                    anchors.right: parent.right
                    linewidth: 30
                    lineheight: 2
                }
            }

            component SwitchImage: Image {
                required property string sourceBaseName
                property bool checked

                source: `Assets/${sourceBaseName}${checked ? "-Checked" : ""}.png`
            }

            component DeviceSwitch: SwitchImage {
                property alias tapMargin: tapHandler.margin

                TapHandler {
                    id: tapHandler
                    onTapped: parent.checked = !parent.checked
                }
            }

            DeviceSwitch{
                x: parent.width * 0.66 - width / 2
                y: 14
                sourceBaseName: "Switch"
                tapMargin: 16

                DeviceText{
                    text: qsTr("MODE")
                    anchors.top: parent.bottom
                    anchors.topMargin: 4
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            SwitchImage{
                x: parent.width * 0.33 - width / 2
                y: 14
                sourceBaseName: "LED"
                checked: footPedal.checked

                DeviceText{
                    text: qsTr("CHECK")
                    anchors.top: parent.bottom
                    anchors.topMargin: 4
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            DeviceSwitch {
                id: footPedal
                sourceBaseName: "Button-Pedal"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 17
                anchors.horizontalCenter: parent.horizontalCenter
            }

            component DeviceDial: Image {
                id:dial
                source: "Assets/Knob-Markings.png"

                property alias text: dialLabel.text

                property int value
                property real angle

                readonly property int minimumValue: 0
                readonly property int maximumValue: 100
                readonly property int range: dial.maximumValue - dial.minimumValue

                DragHandler {
                    target: null
                    onCentroidChanged: updateValueAndRotation()

                    function updateValueAndRotation() {
                        if (centroid.pressedButtons !== Qt.LeftButton) {
                            return
                        }

                        const startAngle = -140
                        const endAngle = 140

                        const yy = dial.height / 2.0 - centroid.position.y
                        const xx = centroid.position.x - dial.width / 2.0

                        const radianAngle = Math.atan2(yy, xx)
                        let newAngle = (-radianAngle / Math.PI * 180) + 90

                        newAngle = ((newAngle - dial.angle + 180) % 360) +
                            dial.angle - 180

                        dial.angle = Math.max(startAngle,
                                              Math.min(newAngle,endAngle))
                        dial.value = (dial.angle - startAngle) / (endAngle -
                                      startAngle) * dial.range

                        console.log("angle: ", dial.angle, "value: ", dial.value)
                    }
                }

                Image {
                    source: "Assets/Knob-Dial.png"
                    anchors.centerIn: parent
                    rotation: dial.angle
                }

                DeviceText {
                    id:dialLabel
                    anchors.top: dial.bottom
                    anchors.horizontalCenter: dial.horizontalCenter
                }

                DeviceText {
                    text: qsTr("MIN")
                    anchors.left: dial.left
                    anchors.bottom: dial.bottom
                    font.pixelSize: 6
                }

                DeviceText {
                    text: qsTr("MAX")
                    anchors.right: dial.right
                    anchors.bottom: dial.bottom
                    font.pixelSize: 6
                }
            }

            DeviceDial {
                anchors.left: footPedal.left
                y: 147 - height / 2
                text: qsTr("TIME")
            }

            DeviceDial {
                anchors.right: footPedal.right
                y: 147 - height / 2
                text: qsTr("FEEDBACK")
            }

            DeviceDial {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 67 - height / 2
                text: qsTr("LEVEL")
            }
        }
    }
}
