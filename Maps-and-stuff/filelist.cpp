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
        return QVariant(m_files[index.row()].fileInfo.absoluteFilePath());
    default:
        return QVariant();
    }
}

void FileList::addFile(QString path, QString id) {
    auto filesSize = m_files.size();
    beginInsertRows(QModelIndex(), filesSize, filesSize);
    m_files.append(file(path, id));
    endInsertRows();
}

void FileList::filterList() {
    if (_markId == "" && _fileType == -1) return;
    beginResetModel();
    m_files = FileStorer::readFile();
    endResetModel();
    file f;
    QList<file> new_files;
    foreach(f, m_files)
    {
        if (f.markId == _markId)
        {
            auto ext = f.fileInfo.completeSuffix();
            if (_fileType == 0)
            {
                if (ext == "mp3" || ext == "ac3" || ext == "wav" || ext == "aif" || ext == "mid" || ext == "flac")
                    new_files.append(f);
            }
            else if (_fileType == 1)
            {
                if (ext == "jpeg" || ext == "jpg" || ext == "raw" || ext == "tiff" || ext == "png" || ext == "gif" || ext == "bmp")
                    new_files.append(f);
            }
            else if (_fileType == 2)
            {
                if (ext == "mkv" || ext == "mpg" || ext == "mov" || ext == "wmv" || ext == "avi")
                    new_files.append(f);
            }
        }
    }
    m_files = new_files;
}

void FileList::readList() {
    beginResetModel();
    m_files = FileStorer::readFile();
    endResetModel();
}

void FileList::storeList() {
    FileStorer::storeFile(m_files);
}
