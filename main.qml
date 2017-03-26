import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import Qt.labs.settings 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
            id: sender
        }

        Page2 {
            id:setter
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Sender")
        }
        TabButton {
            text: qsTr("Settings")
        }
    }
    Settings {
        id:settings
        category: "Main"
        property string from: ""
        property string to: ""
        property string token: ""
        property string switchPassword: ""
        onSwitchPasswordChanged: {
            sender.textField1.text = "SN" + settings.switchPassword + sender.orderBox1.currentText
        }

    }

}
