import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    id: myMusic
    property string srcFile: ""
    Audio {
        id: player
        source: parent.srcFile
    }
    ProgressBar {
        label: "%1 — %2".arg(player.metaData.author)
        .arg(player.metaData.title)
        value: player.position
        maximumValue: player.duration
    }
    Row {
        IconButton {
            icon.source: "image://theme/icon-m-play"
            onClicked: player.play()
        }
        IconButton {
            icon.source: "image://theme/icon-m-pause"
            onClicked: player.pause()
        }
    }

}
