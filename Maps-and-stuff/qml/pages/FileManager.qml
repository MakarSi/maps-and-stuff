import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.FileManager 1.0
import Sailfish.Pickers 1.0
import QtMultimedia 5.6
import MyMap 1.0

Page {
    id: myPage
    property int markId: -1
    property int fileType: -1 // 0 for photos, 1 for videos, 2 for music
    SilicaListView {
        anchors.fill: parent
        FileList{
            id: customFileList
            markId: myPage.markId
            fileType: myPage.fileType
        }
        model: customFileList
        delegate: ListItem {
            Label {
                text: model.path
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.horizontalPageMargin
                color: highlighted ?
                           Theme.highlightColor :
                           Theme.primaryColor
            }
        }
        Button{
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            MyVideo{ id: player }
            onClicked:
            {
                var picker = pageStack.push("Sailfish.Pickers.ImagePickerPage");
                picker.selectedContentChanged.connect(function () {
                    player.path = picker.selectedContent;
                    fileListStorage.addFile(player.path, myPage.markId);
                    fileListStorage.storeList();
                    customFileList.filterList();
                });
            }
        }
    }
}
