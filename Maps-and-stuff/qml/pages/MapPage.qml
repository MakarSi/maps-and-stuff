import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.5
import QtLocation 5.6
//import QtWebKit 3.0
//old qt version for maps???
Page {
    id: pageMap
    /*SilicaListView {
        anchors.fill: parent
        //maybe toolbar is better???
        PullDownMenu {
            MenuItem {
                text: qsTr("Show marks list")
                onClicked: pageStack.push(Qt.resolvedUrl("ListPage.qml"))
            }
        }
    }*/
    Plugin {
        id: osmPlugin
        name: "osm"


        PluginParameter { name: "osm.mapping.host"; value: "https://tile.openstreetmap.org/" }
        PluginParameter { name: "osm.geocoding.host"; value: "https://nominatim.openstreetmap.org" }
        PluginParameter { name: "osm.routing.host"; value: "https://router.project-osrm.org/viaroute" }
        PluginParameter { name: "osm.places.host"; value: "https://nominatim.openstreetmap.org/search" }
        PluginParameter { name: "osm.mapping.copyright"; value: "" }
        PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
    }
    Map {
        id: map
        height: parent.width
        width: parent.width
        plugin: osmPlugin

        Component.onCompleted: {
            for( var i_type in supportedMapTypes ) {
                if( supportedMapTypes[i_type].name.localeCompare( "Custom URL Map" ) === 0 ) {
                    activeMapType = supportedMapTypes[i_type]
                }
            }
        }
    }
}
