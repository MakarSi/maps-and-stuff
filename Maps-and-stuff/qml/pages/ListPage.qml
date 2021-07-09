import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."

Page {
    id: listPage
    SilicaListView {
        anchors.fill: parent
        header: PageHeader { title: qsTr("List of marks") }
        delegate: ListItem {
            Label {
                text: qsTr("Item %1").arg(model.index + 1)
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.horizontalPageMargin
                color: highlighted ?
                           Theme.highlightColor :
                           Theme.primaryColor
            }
        }
        model:
        VerticalScrollDecorator{}
    }
}
