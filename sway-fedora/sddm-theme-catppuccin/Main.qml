
import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    id: container

    width: 640
    height: 480
    color: "#292c35"

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index

    // Colors
    property color backgroundColor: "#292c35"
    property color panelColor: "#d9414559"
    property color borderColor: "#7aa9cd"
    property color textColor: "#c6d0f5"
    property color secondaryColor: "#a5adce"
    property color inputColor: "#242832"
    property color accentColor: "#7aa9cd"
    property color errorColor: "#e78284"
    property color successColor: "#a6d189"

    property string uiFont: "CaskaydiaMono Nerd Font"

    TextConstants {
        id: textConstants
    }

    Connections {
        target: sddm

        function onLoginSucceeded() {
            errorMessage.color = successColor
            errorMessage.text = textConstants.loginSucceeded
        }

        function onLoginFailed() {
            password.text = ""
            errorMessage.color = errorColor
            errorMessage.text = textConstants.loginFailed
        }

        function onInformationMessage(message) {
            errorMessage.color = errorColor
            errorMessage.text = message
        }
    }

    // Background
    Rectangle {
        anchors.fill: parent
        color: backgroundColor
    }

    // Clock
    Clock {
        id: clock

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 24

        color: secondaryColor
        timeFont.family: uiFont
    }

    // Login panel
    Rectangle {
        id: panel

        anchors.centerIn: parent

        width: 420
        height: mainColumn.implicitHeight + 56

        color: panelColor
        border.width: 1
        border.color: borderColor
        radius: 0

        Column {
            id: mainColumn

            anchors.centerIn: parent
            width: 340
            spacing: 18

            // Welcome
            Text {
                width: parent.width

                text: textConstants.welcomeText.arg(sddm.hostName)

                color: textColor
                font.family: uiFont
                font.pixelSize: 21
                font.bold: true

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }

            // Username
            Column {
                width: parent.width
                spacing: 6

                Text {
                    text: textConstants.userName
                    color: secondaryColor
                    font.family: uiFont
                    font.pixelSize: 12
                }

                Rectangle {
                    width: parent.width
                    height: 38

                    color: inputColor
                    border.width: 1
                    border.color: name.activeFocus ? accentColor : "#51576d"
                    radius: 0

                    TextInput {
                        id: name

                        anchors.fill: parent
                        anchors.leftMargin: 12
                        anchors.rightMargin: 12

                        verticalAlignment: TextInput.AlignVCenter
                        text: userModel.lastUser

                        color: textColor
                        selectionColor: accentColor
                        selectedTextColor: backgroundColor

                        font.family: uiFont
                        font.pixelSize: 13

                        KeyNavigation.backtab: rebootButton
                        KeyNavigation.tab: password

                        Keys.onPressed: function(event) {
                            if (event.key === Qt.Key_Return ||
                                event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, sessionIndex)
                                event.accepted = true
                            }
                        }
                    }
                }
            }

            // Password
            Column {
                width: parent.width
                spacing: 6

                Text {
                    text: textConstants.password
                    color: secondaryColor
                    font.family: uiFont
                    font.pixelSize: 12
                }

                Rectangle {
                    width: parent.width
                    height: 38

                    color: inputColor
                    border.width: 1
                    border.color: password.activeFocus ? accentColor : "#51576d"
                    radius: 0

                    TextInput {
                        id: password

                        anchors.fill: parent
                        anchors.leftMargin: 12
                        anchors.rightMargin: 12

                        verticalAlignment: TextInput.AlignVCenter
                        echoMode: TextInput.Password

                        color: textColor
                        selectionColor: accentColor
                        selectedTextColor: backgroundColor

                        font.family: uiFont
                        font.pixelSize: 13

                        KeyNavigation.backtab: name
                        KeyNavigation.tab: session

                        Keys.onPressed: function(event) {
                            if (event.key === Qt.Key_Return ||
                                event.key === Qt.Key_Enter) {
                                sddm.login(name.text, password.text, sessionIndex)
                                event.accepted = true
                            }
                        }
                    }
                }
            }

            // Session and keyboard layout
            Row {
                width: parent.width
                spacing: 12

                // Session
                Column {
                    width: keyboard.enabled && keyboard.layouts.length > 0
                           ? (parent.width - 12) * 0.6
                           : parent.width
                    spacing: 6

                    Text {
                        text: textConstants.session
                        color: secondaryColor
                        font.family: uiFont
                        font.pixelSize: 12
                    }

                    ComboBox {
                        id: session

                        width: parent.width
                        height: 36

                        font.family: uiFont
                        font.pixelSize: 13

                        model: sessionModel
                        index: sessionModel.lastIndex

                        color: inputColor
                        textColor: container.textColor
                        borderColor: "#51576d"
                        borderWidth: 1

                        focusColor: accentColor
                        hoverColor: "#414559"

                        menuColor: inputColor
                        arrowColor: inputColor
                        arrowIcon: Qt.resolvedUrl("chevron-down.png")

                        KeyNavigation.backtab: password
                        KeyNavigation.tab: layoutBox
                    }
                }

                // Keyboard layout
                Column {
                    width: (parent.width - 12) * 0.4
                    spacing: 6

                    visible: keyboard.enabled && keyboard.layouts.length > 0

                    Text {
                        text: textConstants.layout
                        color: secondaryColor
                        font.family: uiFont
                        font.pixelSize: 12
                    }

                    LayoutBox {
                        id: layoutBox

                        width: parent.width
                        height: 36

                        font.family: uiFont
                        font.pixelSize: 13

                        color: inputColor
                        textColor: container.textColor
                        borderColor: "#51576d"
                        borderWidth: 1

                        focusColor: accentColor
                        hoverColor: "#414559"

                        menuColor: inputColor
                        arrowColor: inputColor
                        arrowIcon: Qt.resolvedUrl("angle-down.png")

                        rowDelegate: Rectangle {
                            color: "transparent"

                            Image {
                                id: img

                                source: "/usr/share/sddm/flags/%1.png".arg(
                                    modelItem ? modelItem.modelData.shortName : "zz"
                                )

                                anchors.margins: 4
                                fillMode: Image.PreserveAspectFit

                                anchors.left: parent.left
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                            }

                            Text {
                                anchors.margins: 4
                                anchors.left: img.right
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom

                                verticalAlignment: Text.AlignVCenter

                                text: modelItem
                                      ? modelItem.modelData.shortName : "zz"

                                color: container.textColor
                                font.family: container.uiFont
                                font.pixelSize: 13
                            }
                        }

                        KeyNavigation.backtab: session
                        KeyNavigation.tab: loginButton
                    }
                }
            }

            // Status message
            Text {
                id: errorMessage

                width: parent.width

                text: textConstants.prompt

                color: secondaryColor
                font.family: uiFont
                font.pixelSize: 11

                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
            }

            // Buttons
            Row {
                width: parent.width
                spacing: 8

                // Login
                Rectangle {
                    id: loginButton

                    width: (parent.width - 16) / 3
                    height: 38

                    color: loginArea.pressed || loginArea.containsMouse
                           ? "#51576d" : "#414559"

                    border.width: 1
                    border.color: "#51576d"
                    radius: 0

                    Text {
                        anchors.centerIn: parent

                        text: textConstants.login

                        color: textColor
                        font.family: uiFont
                        font.pixelSize: 11
                    }

                    MouseArea {
                        id: loginArea

                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: sddm.login(name.text, password.text, sessionIndex)
                    }

                    KeyNavigation.backtab: layoutBox
                    KeyNavigation.tab: shutdownButton

                    Keys.onPressed: function(event) {
                        if (event.key === Qt.Key_Return ||
                            event.key === Qt.Key_Enter) {
                            sddm.login(name.text, password.text, sessionIndex)
                            event.accepted = true
                        }
                    }
                }

                // Shutdown
                Rectangle {
                    id: shutdownButton

                    width: (parent.width - 16) / 3
                    height: 38

                    color: shutdownArea.pressed || shutdownArea.containsMouse
                           ? "#51576d" : "#414559"

                    border.width: 1
                    border.color: "#51576d"
                    radius: 0

                    Text {
                        anchors.centerIn: parent

                        text: textConstants.shutdown

                        color: textColor
                        font.family: uiFont
                        font.pixelSize: 11
                    }

                    MouseArea {
                        id: shutdownArea

                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: sddm.powerOff()
                    }

                    KeyNavigation.backtab: loginButton
                    KeyNavigation.tab: rebootButton

                    Keys.onPressed: function(event) {
                        if (event.key === Qt.Key_Return ||
                            event.key === Qt.Key_Enter) {
                            sddm.powerOff()
                            event.accepted = true
                        }
                    }
                }

                // Reboot
                Rectangle {
                    id: rebootButton

                    width: (parent.width - 16) / 3
                    height: 38

                    color: rebootArea.pressed || rebootArea.containsMouse
                           ? "#51576d" : "#414559"

                    border.width: 1
                    border.color: "#51576d"
                    radius: 0

                    Text {
                        anchors.centerIn: parent

                        text: textConstants.reboot

                        color: textColor
                        font.family: uiFont
                        font.pixelSize: 11
                    }

                    MouseArea {
                        id: rebootArea

                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: sddm.reboot()
                    }

                    KeyNavigation.backtab: shutdownButton
                    KeyNavigation.tab: name

                    Keys.onPressed: function(event) {
                        if (event.key === Qt.Key_Return ||
                            event.key === Qt.Key_Enter) {
                            sddm.reboot()
                            event.accepted = true
                        }
                    }
                }
            }
        }
    }

    // Initial focus
    Component.onCompleted: {
        if (name.text == "")
            name.forceActiveFocus()
        else
            password.forceActiveFocus()
    }
}

