import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.3
import QtLocation 5.0
import ".."

Page {
    id: pageMap

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
        center: QtPositioning.coordinate(-27.5, 153.1)
        zoomLevel: 30

        MouseArea{
            anchors.fill: parent;
            onClicked:{
                console.log(QtPositioning.coordinate(-27.5, 153.1).isValid)
                console.log(mouseX, mouseY)
                var circle = Qt.createQmlObject('import QtLocation 5.0; MapCircle {
                MapMouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("You clicked the circle!");
                     }

                }}', map)
                circle.center = map.toCoordinate(Qt.point(mouseX, mouseY), true)
                circle.radius = 500
                circle.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                circle.border.width = 3
                map.addMapItem(circle)
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
    }
}
