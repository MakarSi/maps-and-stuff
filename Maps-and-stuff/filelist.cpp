#include "filelist.h"
#include "filestorer.h"

FileList::FileList(QObject* parent) : QAbstractListModel(parent), m_files()
{

}

QHash<int, QByteArray> FileList::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[PathRole] = "path";
    return roles;
}

QVariant FileList::data(const QModelIndex &index, int role) const {
    if(!index.isValid())
        return QVariant();
    switch(role) {
    case IdRole:
        return QVariant(m_files[index.row()].markId);
    case PathRole:
        return QVariant(m_files[index.row()].filePath);
    default:
        return QVariant();
    }
}

void FileList::addFile(QString path, int id) {
    auto filesSize = m_files.size();
    beginInsertRows(QModelIndex(), filesSize, filesSize);
    m_files.append(file(path, id));
    endInsertRows();
}

void FileList::readList() {
    beginResetModel();
    m_files = FileStorer::readFile();
    endResetModel();
}

void FileList::storeList() {
    FileStorer::storeFile(m_files);
}
