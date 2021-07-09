import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property alias fileId: fileIdLabel.text
    property alias filePath: filePathLabel.text

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: content.height

        Column {
            id: content
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: Theme.horizontalPageMargin
                rightMargin: Theme.horizontalPageMargin
            }
            spacing: Theme.paddingMedium

            PageHeader {
                title: qsTr("File information")
            }

            Label {
                text: qsTr("File id:")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                id: fileIdLabel
                color: Theme.highlightColor
            }

            Label {
                text: qsTr("File path:")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                id: filePathLabel
                color: Theme.highlightColor
            }
        }
        VerticalScrollDecorator {}
    }
}
