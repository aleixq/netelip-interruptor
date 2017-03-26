import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: item1
    property alias textField1: textField1
    property alias button1: button1
    property alias orderBox1: orderBox1
    property alias logger: logger

    Text {
        id: logger
        text: qsTr("")
        anchors.top: columnLayout.bottom
        anchors.topMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        fontSizeMode: Text.Fit
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        font.pixelSize: 12
    }

    ColumnLayout {
        id: columnLayout
        height: 127
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        RowLayout {
            width: 301
            height: 40
            spacing: 5
            Layout.fillWidth: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            anchors.top: parent.top

            ComboBox {
                id: orderBox1
                model: ["ON", "OFF", "CHECK"]
            }

            Button {
                id: button1
                text: qsTr("Send SMS")
            }
        }

        TextField {
            id: textField1
            transformOrigin: Item.Center
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            placeholderText: qsTr("Text Field")
        }
    }
}
