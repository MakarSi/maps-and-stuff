import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.FileManager 1.0
import MyMap 1.0
import Sailfish.Pickers 1.0
import QtMultimedia 5.6
import "."

Page {
    property string srcFile: ""
    Video{
        Row{
            MouseArea{
                id: left
                anchors.left: parent.left
                height: parent.height
                width: parent.width/2
                onDoubleClicked :video.seek(video.position - 5000)
            }
            MouseArea{
                id: right
                anchors.left: left.right
                height: parent.height
                width: parent.width/2
                onDoubleClicked :video.seek(video.position + 5000)
            }
        }
        anchors.centerIn: parent
        width: parent.width
        height: 400
        id: video
        source: srcFile
        focus: true
        Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        Keys.onLeftPressed: video.seek(video.position - 5000)
        Keys.onRightPressed: video.seek(video.position + 5000)
    }
    Row{
        anchors.top: video.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        IconButton {
            icon.source: "image://theme/icon-m-play"
            onClicked: video.play()
        }
        IconButton {
            icon.source: "image://theme/icon-m-pause"
            onClicked: video.pause()
        }
    }
}
