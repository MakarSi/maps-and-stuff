import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.3
import QtLocation 5.0
import ".."

Page {
    id: pageMap

    PositionSource{
        active: true
        onPositionChanged: {
            console.log(position.coordinate)
            map.center = position.coordinate
        }
    }

    Plugin {
        id: osmPlugin
        name: "osm"
        PluginParameter {
        }
    }
    Map {
        id: map
        anchors.fill: parent
        plugin: osmPlugin
        center: QtPositioning.coordinate(59.91, 10.75)
        zoomLevel: 10

        Button {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Text{
                anchors.centerIn: parent
                font.pointSize: 40
                font.bold: true
                style: Text.Outline
                styleColor: "white"
                text: "Marks list"
                color: "black"
            }

            onClicked: pageStack.push("ListPage.qml")
        }

        Button {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            Text{
                anchors.centerIn: parent
                font.pointSize: 40
                font.bold: true
                style: Text.Outline
                styleColor: "white"
                text: "Files list"
                color: "black"
            }

            onClicked: pageStack.push("FilesPage.qml")
        }
    }
}
