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
        zoomLevel: 15

        Component.onCompleted:
        {
            console.log(markListStorage.rowCount());
            //here should be creating map items
            //from marklist
        }

        MapItemView {
            model: markListStorage
            delegate: MapQuickItem {
                coordinate: QtPositioning.coordinate(model.lat, model.longt, model.alt)
                anchorPoint.x: image.width/2
                anchorPoint.y: image.height
                sourceItem: Image {
                    source: "mark_icon.png"
                    id: image
                    width: 48 * Theme.pixelRatio
                    height: sourceSize.height * width /
                            sourceSize.width
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log("Click")
                }
            }
        }

        MouseArea{
            anchors.fill: parent;
            onClicked:{
                console.log(markListStorage.rowCount());
                console.log(mouseX, mouseY);
                var dialog = pageStack.push(Qt.resolvedUrl("MarkAddDialog.qml"));
                dialog.accepted.connect(function() {
                    markListStorage.addMark(dialog.name, "mark_icon.png",
                                            dialog.note, map.toCoordinate(Qt.point(mouseX, mouseY), true));
                });
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
