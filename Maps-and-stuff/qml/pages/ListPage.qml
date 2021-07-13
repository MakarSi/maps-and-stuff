import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."

Page {
    id: listPage

    SilicaListView {
        anchors.fill: parent
        model: markListStorage
        header: PageHeader {
            title: qsTr("My Marks")
        }
        delegate: ListItem {
            Label {
                text: model.name
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.horizontalPageMargin
                color: highlighted ?
                           Theme.highlightColor :
                           Theme.primaryColor
            }
        }
        VerticalScrollDecorator{}
    }
}
