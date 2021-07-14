import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    id: myMusic
    property string srcFile: ""
    Audio {
        id: player
        source: myMusic.srcFile
    }
    ProgressBar {
        id: bar
        anchors.top: parent.top
        anchors.centerIn: parent
        width: parent.width / 2
        label: "%1 — %2".arg(player.metaData.author)
        .arg(player.metaData.title)
        value: player.position
        maximumValue: player.duration
    }
    Row {
        anchors.top: bar.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        IconButton {
            icon.source: "image://theme/icon-m-play"
            onClicked: { console.log(myMusic.srcFile); player.play(); }
        }
        IconButton {
            icon.source: "image://theme/icon-m-pause"
            onClicked: player.pause()
        }
    }

}
