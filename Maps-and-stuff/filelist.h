#ifndef FILELIST_H
#define FILELIST_H

#include "file.h"
#include <QObject>
#include <QAbstractListModel>

class FileList : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY
    (
        QString markId
        READ markId
        WRITE markId
    )

    Q_PROPERTY
    (
        int fileType
        READ fileType
        WRITE fileType
    )

    QString _markId = "";
    int _fileType = -1; // 0 for music, 1 for images, 2 for video
public:
    QString markId() const { return _markId; }
    void markId(QString x) { _markId = x; }

    int fileType() const { return _fileType; }
    void fileType(int x) { _fileType = x; }

    explicit FileList(QObject *parent=nullptr);

    // Note list
    enum FileRoles {
        IdRole = Qt::UserRole + 1,
        PathRole
    };

    virtual int rowCount(const QModelIndex&) const { return m_files.size(); }
    virtual QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;
    Q_INVOKABLE void filterList();
    Q_INVOKABLE void addFile(QString path, QString id);
    Q_INVOKABLE void readList();
    Q_INVOKABLE void storeList();
private:
    QList<file> m_files;
};


#endif // FILELIST_H
