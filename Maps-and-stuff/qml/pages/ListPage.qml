import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.3
import QtLocation 5.0
import ".."

Page {
    id: listPage
    property string mark_name: ""
    property string note_name: ""

    SilicaListView {
        id: silicaView
        model: markListStorage
        anchors.fill: parent
        header: PageHeader {
            title: qsTr("My Marks")
        }
        delegate: ListItem {
            MouseArea{
                anchors.fill: parent
                Component{
                    id: markEditor
                    MarkEditor{}
                }
                onClicked: {
                    listPage.mark_name = model.name;
                    listPage.note_name = model.note;
                    var dialog = pageStack.push(markEditor, {
                                                   markname: model.name,
                                                   markNote: model.note
                                                });
                    dialog.accepted.connect(function() {
                        model.name = dialog.markName;
                        model.image = "mark_icon.png";
                        model.note = dialog.markNote;
                        markListStorage.storeMark();
                        console.log(dialog.markName);
                        console.log(model.name);
                    });
                }
            }
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
