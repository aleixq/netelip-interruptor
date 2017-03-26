import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: item2
    property alias label: label
    property alias sender: sender
    property alias receiver: receiver
    property alias token: token
    property alias switchPassword: switchPassword

    GridLayout {
        id: gridLayout
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        columns: 2
        anchors.fill: parent

        Label {
            id: label
            text: qsTr("From")
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }

        TextField {
            id: sender
            text: settings.from
            placeholderText: qsTr("00346000000")
        }

        Label {
            id: label1
            text: qsTr("To")
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }

        TextField {
            id: receiver
            placeholderText: qsTr("00346000000")
            text: settings.to
            selectByMouse: true
        }

        Label {
            id: label2
            text: qsTr("token")
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }

        TextField {
            id: token
            text: settings.token
            selectByMouse: true
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.IBeamCursor
                acceptedButtons: Qt.NoButton
            }
        }
        Label {
            id: label3
            text: "switch password"
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        }

        TextField {
            id: switchPassword
            text: settings.switchPassword
        }
    }
}
