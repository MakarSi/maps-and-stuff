#include "marklist.h"
#include <QVariant>
#include "markstorer.h"
#include <QDebug>

MarkList::MarkList(QObject* parent) : QAbstractListModel(parent), m_marks()
{

}

QHash<int, QByteArray> MarkList::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[NameRole] = "name";
    roles[ImageRole] = "image";
    roles[NoteRole] = "note";
    roles[AltRole] = "alt";
    roles[LongRole] = "longt";
    roles[LatRole] = "lat";
    return roles;
}

QVariant MarkList::data(const QModelIndex &index, int role) const{
    if(!index.isValid())
        return QVariant();
    switch(role) {
    case IdRole:
        return QVariant(m_marks[index.row()].id);
    case NameRole:
        return QVariant(m_marks[index.row()].name);
    case ImageRole:
        return QVariant(m_marks[index.row()].image);
    case NoteRole:
        return QVariant(m_marks[index.row()].note);
    case AltRole:
        return QVariant(m_marks[index.row()].coord.altitude());
    case LatRole:
        return QVariant(m_marks[index.row()].coord.latitude());
    case LongRole:
        return QVariant(m_marks[index.row()].coord.longitude());
    default:
        return QVariant();
    }
}

void MarkList::addMark(QString name, QString image, QString note, QGeoCoordinate coord) {
    auto marksSize = m_marks.size();
    beginInsertRows(QModelIndex(), marksSize, marksSize);
    m_marks.append(MapMark(name, image, note, coord));
    endInsertRows();
}

void MarkList::readMark() {
    beginResetModel();
    m_marks = MarkStorer::readMark();
    endResetModel();
}

void MarkList::storeMark() {
    MarkStorer::storeMark(m_marks);
}
