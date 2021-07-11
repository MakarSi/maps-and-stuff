import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
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
    Component.onCompleted: fileListStorage.readList()
    Component.onDestruction: fileListStorage.storeList()
}
