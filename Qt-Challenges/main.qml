import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls
import QtQuick.Controls.Basic

Window {
    id: root
    width: 1280
    height: 800
    visible: true
    title: qsTr("Working on")

    StackView {
        id: stackView
        anchors.fill: parent
        // initialItem: practicePage
        initialItem: homeControlPage
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
        id: practicePage
        Rectangle{
            id: rectangleP

            Button {

                //Padding and Font
                leftPadding: 10
                rightPadding: 10
                topPadding: 10
                bottomPadding: 10

                font{
                    family: "wingdings"
                    pixelSize: 24
                }

                contentItem: Label {
                    text: "Click Here"

                    Rectangle {
                        anchors.fill: parent
                        color: "red"
                        opacity: 0.2
                    }
                }

                ////contentItem
                // contentItem: Label{
                //     text: "Click Here"
                //     font.pointSize: 24
                //     font.bold: true
                //     verticalAlignment: Text.AlignVCenter
                // }

                // //Background
                // text: "Click Here"
                // background: Rectangle{
                //     implicitHeight: 50
                //     implicitWidth: 300
                //     color: parent.down ? "#d1d5db" : "#29C878"
                // }

                // //Inset
                // text: "Click Here"
                // topInset: -20
                // leftInset: -20
                // rightInset: -60
                // bottomInset: -60
                // background: Image{
                //     source: "qrc:/Assets/Button-Pedal.png"
                // }
            }

            // Switch {
            //     text: "Bedroom Lights"
            //     checked: true
            // }

            // Switch {
            //     text: "Kitchen Lights"
            // }

            // CheckBox {
            //     text: "Checked"
            //     checked: true
            // }

            // CheckBox {
            //     text: "Partially Checked"
            //     tristate: true
            //     checkState: Qt.PartiallyChecked
            // }

            // //Opaciy
            // Rectangle{
            //     height: 100
            //     width: 100
            //     color: "Green"
            //     Rectangle{
            //         height: 100
            //         width: 100
            //         color: "Pink"
            //         opacity: 0.5
            //         x:50
            //         y:50
            //     }
            // }

            // //Mouse Area and onClicked
            // Rectangle{
            //     id: re1
            //     height: 100
            //     width: 100
            //     color: "Red"
            //     MouseArea{
            //         anchors.fill: parent
            //         onClicked: {console.log("Red")}
            //     }
            // }

            // Rectangle{
            //     id: re2
            //     anchors.left: re1.right
            //     height: 100
            //     width: 100
            //     color: "green"
            //     MouseArea{
            //         anchors.fill: parent
            //         onClicked: {console.log("Green")}
            //     }
            // }

            // Rectangle {
            //     color: "blue"
            //     width: 200
            //     height: 200

            //     Rectangle {
            //         color: "green"
            //         width: 25
            //         height: 25
            //     }

            //     Rectangle {
            //         color: "red"
            //         x: 25
            //         y: 25
            //         width: 50
            //         height: 50
            //         scale: 1.5
            //         //transformOrigin: Item.TopLeft
            //         rotation: 45
            //     }
            // }

            Button {
                id: nextButton
                text: "Next"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    root.title = qsTr("TV Remote Control")    // <- Change title
                    root.minimumWidth = 240                         // <- Change width
                    root.minimumHeight = 740                        // <- Change height
                    root.maximumWidth = minimumWidth
                    root.maximumHeight = minimumHeight
                    stackView.push(tvRemotePage)
                }
            }
        }
    }

    Component{
        // Home Controls Application
        id: homeControlPage
        Rectangle{
            id: rectangle4

            ApplicationWindow {
                id: appWindow1

                width: 1280
                height: 800
                visible: true
                title: qsTr("Home Control Application")
                font.pixelSize: 24

                background: Image{
                    fillMode: Image.PreserveAspectCrop
                    source: Qt.resolvedUrl("qrc:/Assets/hc/BrushedMetal.jpg")
                }

                ClimateControls{
                    anchors.fill: parent
                }

                // visible: true
                // width: 400
                // height: 400

                // header: Label {
                //     text: (view.currentItem as Page).title
                //     horizontalAlignment: Text.AlignHCenter
                // }

                // SwipeView {
                //     id: view
                //     anchors.fill: parent

                //     Page {
                //         title: qsTr("Home")
                //     }
                //     Page {
                //         title: qsTr("Discover")
                //     }
                //     Page {
                //         title: qsTr("Activity")
                //     }
                // }
            }

            Button {
                id: nextButton
                text: "Next"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    root.title = qsTr("TV Remote Control")    // <- Change title
                    root.minimumWidth = 240                         // <- Change width
                    root.minimumHeight = 740                        // <- Change height
                    root.maximumWidth = minimumWidth
                    root.maximumHeight = minimumHeight
                    stackView.push(tvRemotePage)
                }
            }
        }
    }

    Component{
        id: tvRemotePage
        Rectangle{
            id: rectangle3
            color: "Black"
            property color themeColor: "silver"

            component BorderGradient: Rectangle {
                id: borderGradientRectangle

                // BorderGradient:
                // A simple Rectangle with a 2-color gradient

                // We use the Rectangle's own color property as
                // the first gradient stop color (so we upgrade the
                // color property to a required property)
                property color color2: borderGradientRectangle.color.darker()

                color: rectangle3.themeColor

                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: borderGradientRectangle.color
                    }
                    GradientStop {
                        position: 1
                        color: borderGradientRectangle.color2
                    }
                }
            }

            component DoubleBorderGradient: BorderGradient {
                id: doubleBorderGradient

                // DoubleBorderGradient:
                // A BorderGradient with another one nested inside
                // with a specified innerMargin

                property int innerMargin: 2

                BorderGradient {
                    // inner gradient
                    anchors {
                        fill: parent
                        margins: doubleBorderGradient.innerMargin
                    }

                    radius: doubleBorderGradient.radius - doubleBorderGradient.innerMargin

                    // swap the colors around
                    color: doubleBorderGradient.color2
                    color2: doubleBorderGradient.color
                }
            }

            component Button1: DoubleBorderGradient {
                id: button

                // Button:
                // A clickable DoubleBorderGradient with a useful
                // clicked signal and a pressed property alias

                readonly property alias pressed: tapHandler.pressed
                signal clicked

                implicitWidth: 100
                implicitHeight: 40

                radius: Math.min(width, height) / 2

                color: tapHandler.pressed ? rectangle3.themeColor : rectangle3.themeColor.darker()
                color2: tapHandler.pressed ? rectangle3.themeColor.darker() : rectangle3.themeColor

                TapHandler {
                    id: tapHandler
                    gesturePolicy: TapHandler.WithinBounds
                    onTapped: button.clicked()
                }
            }

            component CircleButton: Button1 {
                id: circleButton

                // CircleButton:
                // A circular Button for convenience

                width: 200
                height: width // a circle

                // The CircleButton uses Item's containmentMask
                // property to return the boolean result of a
                // simplified test to check if the point is inside
                // the circle or not.
                containmentMask: QtObject {
                    function contains(clickPoint: point) : bool {
                        return (Math.pow(clickPoint.x - circleButton.radius, 2) +
                                Math.pow(clickPoint.y - circleButton.radius, 2))
                                < Math.pow(circleButton.radius, 2)
                    }
                }
            }

            component KeyButton: Button1{
                width: 47
                height: 40
            }

            QtObject {
                id: tvControl

                // The tvControl object is provided for you to use as a
                // mock back-end providing a number of typical properties
                // and features you might find on a remote control.
                // There are even 5 channels with sample channelNames.

                property int channelNumber: 0
                readonly property string channelName: channelNames[channelNumber]
                readonly property string channelNumberString: `Channel ${channelNumber.toString().padStart(2,"0")}`

                // TV Features
                property bool closedCaptionsEnabled: true
                property bool hdrEnabled: true
                property bool castConnected: true
                property bool listening: false
                property bool muted: false
                property real volume: 0.75
                readonly property bool soundOn: !muted && volume > 0

                function incrementVolume() {
                    volume = Math.min(1, volume + 0.1)
                }

                function decrementVolume() {
                    volume = Math.max(0, volume - 0.1)
                }

                function incrementChannel() {
                    channelNumber = Math.min(channelNames.length - 1, channelNumber + 1)
                }

                function decrementChannel() {
                    channelNumber = Math.max(0, channelNumber - 1)
                }

                property list<string> channelNames: [
                    "News Station",
                    "Comedy Cable",
                    "Eats and Beats",
                    "Weather",
                    "Cartoons",
                    "Reality TV"
                ]
            }

            FontLoader{
                id: silkscreenFont
                source: "qrc:/Fonts/Silkscreen/Silkscreen-Regular.ttf"
            }

            // Here we provide a suggested remote control background
            DoubleBorderGradient {
                id: remoteControlBackground

                anchors.fill: parent
                innerMargin: 8
                radius: 40
            }

            // As a demonstration of one of the Button types,
            // we add a power button.
            CircleButton {
                id: powerButton

                anchors {
                    top: parent.top
                    right: parent.right
                    topMargin: 20
                    rightMargin: 20
                }
                width: 40
                height: 40
                color: "darkred"

                onClicked: root.close()

                Image {
                    width: 20
                    height: 20
                    source: "qrc:/Image/tv/power.svg"
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                }
            }

            DoubleBorderGradient{
                id: lcdScreen
                anchors{
                    top: powerButton.bottom
                    left: parent.left
                    right: parent.right
                    margins: 20
                }
                height: 100
                radius: 8
                color: "#93AA4B"
                innerMargin: 1

                Item {
                    id: lcdContentItem
                    anchors.fill: parent
                    anchors.margins: 10
                    opacity: 0.5

                    Rectangle{
                        id: volumeIndicator
                        width: 12
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        border.color: "Black"
                        border.width: 2
                        color: "Transparent"

                        Rectangle{
                            id: volumValue
                            width: volumeIndicator.width
                            height: volumeIndicator.height * tvControl.volume
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            color: "Black"
                        }
                    }

                    Text {
                        id: channelNoText
                        text: tvControl.channelNumberString
                        anchors{
                            top: parent.top
                            right: volumeIndicator.left
                            left: parent.left
                            topMargin: -8
                            rightMargin: 4
                        }
                        font{
                            family: silkscreenFont.font.family
                            pixelSize: 20
                        }
                    }

                    Text{
                        id: channelNameText
                        text: tvControl.channelName
                        anchors{
                            top: channelNoText.bottom
                            right: volumeIndicator.left
                            left: parent.left
                            rightMargin: 4
                        }
                        font{
                            family: silkscreenFont.font.family
                            pixelSize: 16
                        }
                    }

                    Image {
                        id: closedCaptionsIcon
                        source: "qrc:/Image/tv/closed_caption.svg"
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        width: 32
                        height: 32
                        fillMode: Image.PreserveAspectFit
                        visible: tvControl.closedCaptionsEnabled
                    }

                    Image {
                        id: hdrIcon
                        source: "qrc:/Image/tv/hdr_on.svg"
                        anchors.bottom: parent.bottom
                        anchors.left: closedCaptionsIcon.right
                        anchors.leftMargin: 2
                        width: 32
                        height: 32
                        fillMode: Image.PreserveAspectFit
                        visible: tvControl.hdrEnabled
                    }

                    Image {
                        id: castConnectedIcon
                        source: "qrc:/Image/tv/cast_connected.svg"
                        anchors.bottom: parent.bottom
                        anchors.left: hdrIcon.right
                        anchors.leftMargin: 2
                        width: 32
                        height: 32
                        fillMode: Image.PreserveAspectFit
                        visible: tvControl.castConnected
                    }

                    Image {
                        id: listeningIcon
                        source: "qrc:/Image/tv/mic.svg"
                        anchors.bottom: parent.bottom
                        anchors.left: castConnectedIcon.right
                        anchors.leftMargin: 2
                        width: 32
                        height: 32
                        fillMode: Image.PreserveAspectFit
                        visible: tvControl.castConnected
                    }

                    Image {
                        id: muteIcon
                        source: `Image/tv/speaker${tvControl.soundOn ? "" : "_muted"}.svg`
                        anchors.bottom: parent.bottom
                        anchors.left: listeningIcon.right
                        anchors.leftMargin: 2
                        width: 32
                        height: 32
                        fillMode: Image.PreserveAspectFit
                        visible: tvControl.castConnected
                    }
                }
            }

            Item {
                id: featureButtons
                anchors{
                    top: lcdScreen.bottom
                    left: parent.left
                    right: parent.right
                    leftMargin: 20
                    rightMargin: 20
                    topMargin: 20
                }
                height: 40

                KeyButton{
                    id: ccButton
                    anchors.left: parent.left

                    Image{
                        source: "qrc:/Image/tv/closed_caption_white.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        height: 24
                        width:24
                    }
                }

                KeyButton{
                    id: hdrButton
                    anchors.left: ccButton.right
                    anchors.leftMargin: 4

                    Image{
                        source: "qrc:/Image/tv/hdr_on_white.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        height: 24
                        width:24
                    }
                }

                KeyButton{
                    id: castButton
                    anchors.left: hdrButton.right
                    anchors.leftMargin: 4

                    Image{
                        source: "qrc:/Image/tv/cast_white.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        height: 24
                        width:24
                    }
                }

                KeyButton{
                    id: muteButton
                    anchors.left: castButton.right
                    anchors.leftMargin: 4

                    Image{
                        source: "qrc:/Image/tv/speaker_muted_white.svg"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        height: 24
                        width:24
                    }
                }
            }

            Item {
                id: circuleFeature
                anchors{
                    top: featureButtons.bottom
                    topMargin: 20
                    horizontalCenter: parent.horizontalCenter
                }
                width: 200
                height: 200
                rotation: 45

                Item {
                    id: outerCircle
                    anchors.fill: parent
                    Item {
                        id: topButton
                        height: 100
                        width: 100
                        anchors.top: parent.top
                        anchors.left: parent.left
                        clip: true
                        CircleButton{
                            rotation: -45

                            Image {
                                id: settingImage
                                source: "qrc:/Image/tv/settings.svg"
                                anchors{
                                    top: parent.top
                                    topMargin: 10
                                    horizontalCenter: parent.horizontalCenter
                                }
                                width: 32
                                height: 32
                                fillMode: Image.PreserveAspectFit
                            }
                        }
                    }

                    Item {
                        id: rightButton
                        height: 100
                        width: 100
                        anchors.top: parent.top
                        anchors.right: parent.right
                        clip: true
                        CircleButton{
                            rotation: -45
                            anchors.horizontalCenter: parent.left

                            Image {
                                id: rightArrowImage
                                source: "qrc:/Image/tv/fast_forward.svg"
                                anchors{
                                    right: parent.right
                                    rightMargin: 10
                                    verticalCenter: parent.verticalCenter
                                }
                                width: 32
                                height: 32
                                fillMode: Image.PreserveAspectFit
                            }
                        }
                    }

                    Item {
                        id: bottomButton
                        height: 100
                        width: 100
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        clip: true
                        CircleButton{
                            rotation: -45
                            anchors.horizontalCenter: parent.left
                            anchors.verticalCenter: parent.top

                            Image {
                                id: playImage
                                source: "qrc:/Image/tv/play_pause.svg"
                                anchors{
                                    bottom: parent.bottom
                                    bottomMargin: 10
                                    horizontalCenter: parent.horizontalCenter
                                }
                                width: 32
                                height: 32
                                fillMode: Image.PreserveAspectFit
                            }
                        }
                    }

                    Item {
                        id: leftButton
                        height: 100
                        width: 100
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        clip: true
                        CircleButton{
                            rotation: -45
                            anchors.verticalCenter: parent.top

                            Image {
                                id: leftArrowImage
                                source: "qrc:/Image/tv/fast_rewind.svg"
                                anchors{
                                    left: parent.left
                                    leftMargin: 10
                                    verticalCenter: parent.verticalCenter
                                }
                                width: 32
                                height: 32
                                fillMode: Image.PreserveAspectFit
                            }
                        }
                    }
                }

                CircleButton{
                    id: midSmallCircle
                    width:100
                    height: width
                    anchors{
                        centerIn: parent
                    }
                    Image{
                        source: "qrc:/Image/tv/mic_white.svg"
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                        height: 48
                        width: 48
                    }
                }
            }



            Button {
                id: nextButton
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
                source: "qrc:/Fonts/RussoOne-Regular.ttf"
            }

            FontLoader{
                id: prismaFontLoader
                source: "qrc:/Fonts/Prisma.ttf"
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

            Button {
                text: "Next"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    root.title = qsTr("Business Card")    // <- Change title
                    root.minimumWidth = 640                         // <- Change width
                    root.minimumHeight = 360                        // <- Change height
                    root.maximumWidth = minimumWidth
                    root.maximumHeight = minimumHeight                  // <- Change height
                    stackView.push(businessCardPage)
                }
            }
        }
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
        }

    }


}
