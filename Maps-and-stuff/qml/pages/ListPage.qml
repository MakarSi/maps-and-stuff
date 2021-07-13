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
                        name = dialog.markName;
                        image = "mark_icon.png";
                        note = dialog.markNote;
                        markListStorage.storeMark();
                        console.log(dialog.markName);
                        console.log(model.name);
                    });

                    // Column is always zero as it's a list
                    var column_number = 0;
                    // get `QModelIndex`
                    var q_model_index = markListStorage.index(index, column_number);

                    // see for list of roles:
                    // http://doc.qt.io/qt-5/qabstractitemmodel.html#roleNames
                    var role = 1

                    var data_changed = markListStorage.setData(q_model_index, "3", role);

                    console.log("data change successful?", data_changed);
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
