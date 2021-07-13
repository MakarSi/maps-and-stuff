import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."

Dialog{
    id: markAddDialog
    property string name: ""
    property string image: ""
    property string note: ""

    DialogHeader {
        id: markAddHeader
        acceptText: qsTr("Create")
        title: qsTr("New mark")
    }

    Column {
        id: content
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: markAddHeader.bottom
            leftMargin: Theme.horizontalPageMargin
            rightMargin: Theme.horizontalPageMargin
        }

        spacing: Theme.paddingMedium

        Label {
            text: qsTr("Mark name:")
            font.pixelSize: Theme.fontSizeSmall
        }

        TextField {
            id: markNameField
            width: parent.width
            placeholderText: qsTr("Mark name")
        }

        Label {
            text: qsTr("Note text:")
            font.pixelSize: Theme.fontSizeSmall
        }

        TextArea {
            id: noteTextArea
            width: parent.width
            placeholderText: qsTr("Note text")
        }

    }
    onAccepted: {
        markAddDialog.name = markNameField.text
        markAddDialog.note = noteTextArea.text
    }
}
