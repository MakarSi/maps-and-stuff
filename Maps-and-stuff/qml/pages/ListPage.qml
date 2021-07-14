import QtQuick 2.0
import Sailfish.Silica 1.0
import QtPositioning 5.3
import QtLocation 5.0
import ".."

Page {
    id: listPage
    property string mark_name: ""
    property string note_name: ""

    ListView {
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
                                                   markName: model.name,
                                                   markNote: model.note
                                                });
                    dialog.accepted.connect(function() {
                        var tmp_lat = model.lat;
                        var tmp_longt = model.longt;
                        var tmp_alt = model.alt;
                        markListStorage.deleteElem(model.lat, model.longt, model.alt);
                        markListStorage.addMark(dialog.markName, "mark_icon.png", dialog.markNote,
                                                 QtPositioning.coordinate(tmp_lat, tmp_longt, tmp_alt) );
                        markListStorage.storeMark();
                        console.log(dialog.markName);
                        console.log(model.name);
                        pageStack.push("MapPage.qml");
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
