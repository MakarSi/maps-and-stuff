import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.FileManager 1.0
import Sailfish.Pickers 1.0
import QtMultimedia 5.6
import MyMap 1.0

Page {
    id: myPage
    property string markId: ""
    property int fileType: -1 // 0 for photos, 1 for videos, 2 for music
    property string src: "music.png"
    FileList{
        id: customFileList
        markId: myPage.markId
        fileType: myPage.fileType
    }
    Component.onDestruction: console.log("asdas")
    SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            title: qsTr("Related files")
        }
        model: customFileList
        delegate: ListItem {
            Label {
                anchors.leftMargin: 50
                Image{
                    source: src
                    x: -30
                    width: 30
                    height: 30
                    anchors.verticalCenter: parent.verticalCenter
                }
                text: model.name
                font.pixelSize: 25
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.horizontalPageMargin
                color: highlighted ?
                           Theme.highlightColor :
                           Theme.primaryColor
                MouseArea{
                    anchors.fill: parent
                    z: 2
                    onClicked: {
                        if (fileType == 0)
                            pageStack.push("MyPhoto.qml", {
                                               srcFile: model.path + '/' + model.name
                                           });
                        else if (fileType == 1)
                            pageStack.push("MyVideo.qml", {
                                               srcFile: model.path + '/' + model.name
                                           });
                        else if (fileType == 2)
                            pageStack.push("MyMusic.qml", {
                                               srcFile: model.path + '/' + model.name
                                           });
                    }
                    onPressed: {
                        butt.visible = true;
                        console.log("Hello!");
                    }
                }
            }
            Button{
                id: butt;
                width: 80
                height: 40
                z: 1
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right;
                anchors.rightMargin: Theme.horizontalPageMargin
                text: "x";
                visible: false;
                onClicked:
                {
                    var path = model.path + '/' + model.name;
                    fileListStorage.deleteOne(customFileList, path);
                    fileListStorage.storeList();
                    customFileList.filterList();
                    console.log(model.path);
                    visible = false;
                }
            }
        }
        Button{
            id: add
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            preferredWidth: Theme.buttonWidthExtraSmall
            text: qsTr("Add file")
            onClicked:
            {
                var str = ".ImagePickerPage";
                if (fileType == 0)
                    str = ".ImagePickerPage";
                else if (fileType == 1)
                    str = ".VideoPickerPage";
                else if (fileType == 2)
                    str = ".MusicPickerPage";
                var picker = pageStack.push("Sailfish.Pickers" + str);
                picker.selectedContentChanged.connect(function () {
                    fileListStorage.addFile(picker.selectedContent, myPage.markId);
                    fileListStorage.storeList();
                    customFileList.filterList();
                });
            }
        }
        Button{
            anchors.bottom: parent.bottom
            anchors.right: add.left
            anchors.rightMargin: 10
            preferredWidth: Theme.buttonWidthExtraSmall
            text: qsTr("Delete all")
            onClicked:
            {
                fileListStorage.deleteThese(customFileList);
                fileListStorage.storeList();
                customFileList.filterList();
            }
        }
    }
}
