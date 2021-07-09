import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."
import "."

Page {
    id: page

    SilicaListView {
        id: filesView
        anchors.fill: parent
        model: fileListStorage
        header: PageHeader {
            title: qsTr("My Files")
        }
        delegate: BackgroundItem {
            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    leftMargin: Theme.horizontalPageMargin
                    rightMargin: Theme.horizontalPageMargin
                }
                text: model.path
            }

            Component {
                id: fileViewPage
                FileViewPage {}
            }
        }
         VerticalScrollDecorator {}
    }
}

