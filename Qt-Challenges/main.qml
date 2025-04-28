import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    width: 1280
    height: 720
    visible: true
    title: qsTr("Business card")


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

    Rectangle {
        id: rectangle1
        width: root.width * 0.5
        height: root.height * 0.5
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

    // Rectangle {
    //     id: rectangle4
    //     width: root.width * 0.5
    //     height: root.height * 0.5
    //     color: "blue"
    //     anchors.right: parent.right
    //     anchors.bottom: parent.bottom

    // }
}
