import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."

Dialog{
    id: markEditor
    property string markName: ""
    property string markNote: ""

    DialogHeader {
        id: markAddHeader
        acceptText: qsTr("Accept")
        title: "Edit mark"
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
            text: markName
        }

        Label {
            text: qsTr("Note text:")
            font.pixelSize: Theme.fontSizeSmall
        }

        TextArea {
            id: noteTextArea
            width: parent.width
            text: markNote
        }

    }

    onAccepted: {
        markEditor.markName = markNameField.text
        markEditor.markNote = noteTextArea.text
        console.log(markEditor.markName)
        console.log(markEditor.markNote)
    }
}
