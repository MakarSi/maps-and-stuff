import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "."
import MyMap 1.0

ApplicationWindow
{
    initialPage: Component { MapPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    FileList {
        id: fileListStorage
    }
    allowedOrientations: defaultAllowedOrientations
    Component.onCompleted: fileListStorage.readList()
    Component.onDestruction: fileListStorage.storeList()
}
