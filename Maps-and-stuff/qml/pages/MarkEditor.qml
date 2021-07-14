import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."

Dialog{
    id: markEditor
    property string markName: ""
    property string markNote: ""
    property string markId: ""

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
        Component{
            id: fileManager
            FileManager {}
        }

        Button{
            width: parent.width
            height: 100
            text: "Images"
            onClicked: {
                customFileList.filterList();
                customFileList.markId = markEditor.markId;
                customFileList.fileType = 0;
                customFileList.filterList();
                pageStack.push(fileManager, { markId: markEditor.markId,
                                              fileType: 0,
                                              src: "image.png"});
            }
        }

        Button{
            width: parent.width
            height: 100
            text: "Videos"
            onClicked: {
                customFileList.filterList();
                customFileList.markId = markEditor.markId;
                customFileList.fileType = 1;
                customFileList.filterList();
                    pageStack.push(fileManager, { markId: markEditor.markId,
                                              fileType: 1,
                                              src: "video.png"});
            }
        }

        Button{
            width: parent.width
            height: 100
            text: "Music"
            onClicked: {
                customFileList.filterList();
                customFileList.markId = markEditor.markId;
                customFileList.fileType = 2;
                customFileList.filterList();
                pageStack.push(fileManager, { markId: markEditor.markId,
                                              fileType: 2,
                                              src: "music.png"});
            }
        }

    }

    onAccepted: {
        markEditor.markName = markNameField.text
        markEditor.markNote = noteTextArea.text
        console.log(markEditor.markName)
        console.log(markEditor.markNote)
    }
}
