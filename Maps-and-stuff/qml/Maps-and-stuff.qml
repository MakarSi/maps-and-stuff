import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "."
import MyMap 1.0

ApplicationWindow
{
    initialPage: Component { MapPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
    MarkList{
        id: markListStorage
    }
    FileList {
        id: fileListStorage
    }
    Component.onCompleted: {
        markListStorage.readMark()
        fileListStorage.readList()
    }
    Component.onDestruction: {
        markListStorage.storeMark()
        fileListStorage.storeList()
    }
}
