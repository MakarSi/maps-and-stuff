import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.3
//import QtLocation 5.0
//import QtWebKit 3.0
//old qt version for maps???
Page {
    id: pageMap
    SilicaListView {
        anchors.fill: parent
        //maybe toolbar is better???
        PullDownMenu {
            MenuItem {
                text: qsTr("Show marks list")
                onClicked: pageStack.push(Qt.resolvedUrl("ListPage.qml"))
            }
        }
    }
 /*   Plugin
    {
        id: mapPlugin
        name: "osm"
        PluginParameter
        {
            name: "osm";
        }
    }
    Map {
        id: map
        plugin: mapPlugin
        zoomLevel: 16
        width: pageMap.width
        height: pageMap.height
        MouseArea{
            anchors.fill: parent
            onClicked: console.log("Click");
        }
    }*/
}
