#include "marklist.h"
#include <QVariant>
//#include "datastorer.h"
#include <QDebug>

MarkList::MarkList(QObject* parent) : QAbstractListModel(parent), m_marks()
{

}

QHash<int, QByteArray> MarkList::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[NameRole] = "name";
    roles[ColorRole] = "color";
    roles[ImageRole] = "image";
    roles[NoteRole] = "note";
    roles[XRole] = "x_coord";
    roles[YRole] = "y_coord";
    return roles;
}

QVariant MarkList::data(const QModelIndex &index, int role) const {
    if(!index.isValid())
        return QVariant();
    switch(role) {
    case IdRole:
        return QVariant(m_marks[index.row()].id);
    case NameRole:
        return QVariant(m_marks[index.row()].name);
    case ColorRole:
        return QVariant(m_marks[index.row()].color);
    case ImageRole:
        return QVariant(m_marks[index.row()].image);
    case NoteRole:
        return QVariant(m_marks[index.row()].note);
    case XRole:
        return QVariant(m_marks[index.row()].x_coord);
    case YRole:
        return QVariant(m_marks[index.row()].y_coord);
    default:
        return QVariant();
    }
}

void MarkList::addMark(int id, QString name, QColor color, QImage image, QString note, double x_coord, double y_coord) {
    auto marksSize = m_marks.size();
    beginInsertRows(QModelIndex(), marksSize, marksSize);
    m_marks.append(MapMark(id, name, color, image, note, x_coord, y_coord));
    endInsertRows();
}
/*
void MarkList::readList() {
    beginResetModel();
    m_marks = DataStorer::readData();
    endResetModel();
}

void MarkList::storeList() {
    DataStorer::storeData(m_marks);
}*/

