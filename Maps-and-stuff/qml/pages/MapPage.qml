import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.3
import QtLocation 5.0
import ".."

Page {
    id: pageMap

   Location {
        id: location
        coordinate {
            latitude: -27.5
            longitude: 153.1
        }
    }

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
        plugin: Plugin { name: "osm" }
        center: QtPositioning.coordinate(50, 30)
        gesture.enabled: true
        zoomLevel: 4

        MapMouseArea{
            anchors.fill: parent;
            onClicked:{
                console.log(mouseX, mouseY)
                location.coordinate = map.toCoordinate(Qt.point(mouseX, mouseY), true)
                console.log(location.coordinate)
            }
        }

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
        Button {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            Text{
                anchors.centerIn: parent
                font.pointSize: 40
                font.bold: true
                style: Text.Outline
                styleColor: "white"
                text: "File manager"
                color: "black"
            }
            onClicked: pageStack.push("FileManager.qml")
        }
    }
}
