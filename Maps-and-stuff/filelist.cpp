#include "filelist.h"
#include "filestorer.h"

FileList::FileList(QObject* parent) : QAbstractListModel(parent), m_files()
{
    readList();
    filterOurList();
}

QHash<int, QByteArray> FileList::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[DirRole] = "path";
    roles[NameRole] = "name";
    return roles;
}

QVariant FileList::data(const QModelIndex &index, int role) const {
    if(!index.isValid())
        return QVariant();
    switch(role) {
    case IdRole:
        return QVariant(m_files[index.row()].markId);
    case DirRole:
        return QVariant(m_files[index.row()].fileInfo.path());
    case NameRole:
        return QVariant(m_files[index.row()].fileInfo.fileName());
    default:
        return QVariant();
    }
}

void FileList::addFile(QString path, QString id) {
    file f;
    QFileInfo fi(path);
    QString base_name = fi.baseName();
    foreach(f, m_full)
        if (f.fileInfo.baseName().contains(base_name) && f.markId == id)
            return;
    auto filesSize = m_full.size();
    beginInsertRows(QModelIndex(), filesSize, filesSize);
    m_full.append(file(path, id));
    endInsertRows();
}

void FileList::filterList() {
    beginResetModel();
    m_files = FileStorer::readFile();
    endResetModel();
    if (_markId == "" && _fileType == -1) return;
    beginResetModel();
    file f;
    QList<file> new_files;
    foreach(f, m_files)
    {
        if (f.markId == _markId)
        {
            auto ext = f.fileInfo.completeSuffix();
            if (_fileType == 2)
            {
                if (ext == "mp3" || ext == "ac3" || ext == "wav" || ext == "aif" || ext == "mid" || ext == "flac")
                    new_files.append(f);
            }
            else if (_fileType == 0)
            {
                if (ext == "jpeg" || ext == "jpg" || ext == "raw" || ext == "tiff" || ext == "png" || ext == "gif" || ext == "bmp")
                    new_files.append(f);
            }
            else if (_fileType == 1)
            {
                if (ext == "mkv" || ext == "mpg" || ext == "mov" || ext == "wmv" || ext == "avi")
                    new_files.append(f);
            }
        }
    }
    m_files = new_files;
    endResetModel();
}

void FileList::filterOurList()
{
    file f;
    foreach(f, m_full) qDebug() << f.fileInfo.baseName() << '\n';
    qDebug() << "---------------\n";
    beginResetModel();
    endResetModel();
    if (_markId == "" && _fileType == -1) {m_files = m_full; return;}
    beginResetModel();
    QList<file> new_files;
    foreach(f, m_full)
    {
        if (f.markId == _markId)
        {
            auto ext = f.fileInfo.completeSuffix();
            if (_fileType == 2)
            {
                if (ext == "mp3" || ext == "ac3" || ext == "wav" || ext == "aif" || ext == "mid" || ext == "flac")
                    new_files.append(f);
            }
            else if (_fileType == 0)
            {
                if (ext == "jpeg" || ext == "jpg" || ext == "raw" || ext == "tiff" || ext == "png" || ext == "gif" || ext == "bmp")
                    new_files.append(f);
            }
            else if (_fileType == 1)
            {
                if (ext == "mkv" || ext == "mpg" || ext == "mov" || ext == "wmv" || ext == "avi" || ext == "webm")
                    new_files.append(f);
            }
        }
    }
    m_files = new_files;
    endResetModel();
}

void FileList::readList() {
    beginResetModel();
    m_full = FileStorer::readFile();
    endResetModel();
}

void FileList::storeList() {
    FileStorer::storeFile(m_full);
}
