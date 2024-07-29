import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import SddmComponents 2.0
import "."

Rectangle {
    id: container
    LayoutMirroring.enabled: Qt.locale().textDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true
    property int sessionIndex: session.index
    property date dateTime: new Date()

    TextConstants {
        id: textConstants
    }

    Connections {
        target: sddm
        function onLoginSucceeded() {
            errorMessage.text = textConstants.loginSucceeded
        }
        function onLoginFailed() {
            password.text = ""
            errorMessage.color = "#ff3333"
            errorMessage.text = textConstants.loginFailed
        }
    }

    FontLoader {
        id: myFont
        source: "Inter-Variable.ttf"
    }

    color: "#1e1c2c"
    anchors.fill: parent

    Image {
        id: behind
        anchors.fill: parent
        source: config.background
        fillMode: Image.Stretch
    }

    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height / 12
        Timer {
            interval: 100; running: true; repeat: true;
            onTriggered: container.dateTime = new Date()
        }

        Text {
            id : date
            Layout.alignment: Qt.AlignCenter
            color : "#cecece"
            text: Qt.formatDateTime(container.dateTime, "dddd MMMM d")
            font.pointSize: 12
            font.weight: Font.Bold
            font.family: myFont.name
        }

        Text {
            id : time
            Layout.alignment: Qt.AlignCenter
            color : "#f2f2f2"
            text: Qt.formatDateTime(container.dateTime, "h:mm ap")
            font.family: myFont.name
            font.pointSize: 48
            font.weight: Font.Bold
        }
    }


    ColumnLayout{
        id: centerBox
        anchors.centerIn:parent
        spacing: 16

        RowLayout {

            Text {
                id: userlabel
                font.family: myFont.name
                font.pointSize: 9
                font.weight: Font.Normal
                text: textConstants.userName
                color: "#cecece"
                Layout.preferredWidth: 96
            }

            Image {
                source: "assets/input.svg"
                width: 280
                height: 32

                TextField {
                    id: nameinput
                    focus: true
                    anchors.fill: parent
                    text: userModel.lastUser
                    font.family: myFont.name
                    font.pointSize: 10
                    color: "white"
                    background: Image {
                        id: textback
                        source: "assets/inputhi.svg"

                        states: [
                            State {
                                name: "yay"
                                PropertyChanges {
                                    target: textback
                                    opacity: 1
                                }
                            },
                            State {
                                name: "nay"
                                PropertyChanges {
                                    target: textback
                                    opacity: 0
                                }
                            }
                        ]

                        transitions: [
                            Transition {
                                to: "yay"
                                NumberAnimation {
                                    target: textback
                                    property: "opacity"
                                    from: 0
                                    to: 1
                                    duration: 200
                                }
                            },

                            Transition {
                                to: "nay"
                                NumberAnimation {
                                    target: textback
                                    property: "opacity"
                                    from: 1
                                    to: 0
                                    duration: 200
                                }
                            }
                        ]
                    }

                    KeyNavigation.tab: password
                    KeyNavigation.backtab: password

                    Keys.onPressed: (event)=> {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            password.focus = true
                        }
                    }

                    onActiveFocusChanged: {
                        if (activeFocus) {
                            textback.state = "yay"
                        } else {
                            textback.state = "nay"
                        }
                    }
                }
            }
        Rectangle {
            color: "transparent"
            width: 96
            height: 2
            Layout.preferredWidth: 96
        }
        } // RowLayout

        RowLayout {

            Text {
                id: passwordlabel
                text: textConstants.password
                font.family: myFont.name
                font.pointSize: 9
                font.weight: Font.Normal
                color: "#cecece"
                Layout.preferredWidth: 96
            }

            Image {
                source: "assets/input.svg"
                width: 280
                height: 32
                TextField {
                    id: password
                    anchors.fill: parent
                    font.pointSize: 10
                    echoMode: TextInput.Password
                    color: "white"

                    background: Image {
                        id: textback1
                        source: "assets/inputhi.svg"

                        states: [
                            State {
                                name: "yay1"
                                PropertyChanges {
                                    target: textback1
                                    opacity: 1
                                }
                            },
                            State {
                                name: "nay1"
                                PropertyChanges {
                                    target: textback1
                                    opacity: 0
                                }
                            }
                        ]

                        transitions: [
                            Transition {
                                to: "yay1"
                                NumberAnimation {
                                    target: textback1
                                    property: "opacity"
                                    from: 0
                                    to: 1
                                    duration: 200
                                }
                            },

                            Transition {
                                to: "nay1"
                                NumberAnimation {
                                    target: textback1
                                    property: "opacity"
                                    from: 1
                                    to: 0
                                    duration: 200
                                }
                            }
                        ]
                    }

                    KeyNavigation.tab: nameinput
                    KeyNavigation.backtab: nameinput

                    Keys.onPressed: (event)=> {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            sddm.login(nameinput.text, password.text, sessionIndex)
                            event.accepted = true
                        }
                    }

                    onActiveFocusChanged: {
                        if (activeFocus) {
                            textback1.state = "yay1"
                        } else {
                            textback1.state = "nay1"
                        }
                    }
                }
            }

        Image {
            id: loginButton
            source: "assets/buttonup.svg"

            property string toolTipText3: textConstants.login
            ToolTip.text: toolTipText3
            ToolTip.delay: 500
            ToolTip.visible: toolTipText3 ? ma3.containsMouse : false

            MouseArea {
                id: ma3
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.source = "assets/buttonhover.svg"
                }
                onExited: {
                    parent.source = "assets/buttonup.svg"
                }
                onPressed: {
                    parent.source = "assets/buttondown.svg"
                    sddm.login(nameinput.text, password.text, sessionIndex)
                }
                onReleased: {
                    parent.source = "assets/buttonup.svg"
                }
            }
        }
    }
    }

    Row {
        spacing: 32
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 3 / 4
        ColumnLayout {
            Image {
                id: shutdownButton
                source: "assets/shutdown.svg"
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 32
                Layout.preferredHeight: 32
                height: 32
                width: 32

                property string toolTipText1: textConstants.shutdown
                ToolTip.text: toolTipText1
                ToolTip.delay: 500
                ToolTip.visible: toolTipText1 ? ma1.containsMouse : false

                MouseArea {
                    id: ma1
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.source = "assets/shutdownhover.svg"
                    }
                    onExited: {
                        parent.source = "assets/shutdown.svg"
                    }
                    onPressed: {
                        parent.source = "assets/shutdownpressed.svg"
                        sddm.powerOff()
                    }
                    onReleased: {
                        parent.source = "assets/shutdown.svg"
                    }
                }
            }

            Text {
                color: "#cecece"
                font.pointSize: 8
                font.family: myFont.name
                font.weight: Font.Light
                text: textConstants.shutdown
            }
        }

    ColumnLayout {
            Image {
                id: rebootButton
                source: "assets/reboot.svg"
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 32
                Layout.preferredHeight: 32
                height: 32
                width: 32

                property string toolTipText2: textConstants.reboot
                ToolTip.text: toolTipText2
                ToolTip.delay: 500
                ToolTip.visible: toolTipText2 ? ma2.containsMouse : false

                MouseArea {
                    id: ma2
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.source = "assets/reboothover.svg"
                    }
                    onExited: {
                        parent.source = "assets/reboot.svg"
                    }
                    onPressed: {
                        parent.source = "assets/rebootpressed.svg"
                        sddm.reboot()
                    }
                    onReleased: {
                        parent.source = "assets/reboot.svg"
                    }
                }
            }

            Text {
                color: "#cecece"
                font.pointSize: 8
                font.family: myFont.name
                font.weight: Font.Light
                text: textConstants.reboot
            }
    }
    }


    RowLayout {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 16
            anchors.rightMargin: 16

        Text {
            font.family: myFont.name
            font.pointSize: 8
            font.weight: Font.Normal
            text: textConstants.session
            color: "#cecece"
        }
        ComboBox {
            id: session
            color: "#3b3749"
            hoverColor: "#bbbbbb"
            textColor: "#f8f8f8"
            menuColor: "#565658"
            width: 196
            height: 24
            font.pointSize: 8
            font.family: myFont.name
            font.weight: Font.DemiBold
            arrowBox: "assets/comboarrow.svg"
            backgroundNormal: "assets/cbox.svg"
            backgroundHover: "assets/cboxhover.svg"
            backgroundPressed: "assets/cboxhover.svg"
            model: sessionModel
            index: sessionModel.lastIndex
            KeyNavigation.backtab: password
            KeyNavigation.tab: nameinput
        }
    }

    Component.onCompleted: {
        nameinput.focus = true
        textback1.state = "nay1" //dunno why both inputs get focused
    }
}
