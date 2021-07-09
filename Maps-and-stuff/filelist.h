#ifndef FILELIST_H
#define FILELIST_H

#include "file.h"
#include <QObject>
#include <QAbstractListModel>

class FileList : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit FileList(QObject *parent=nullptr);

    // Note list
    enum FileRoles {
        IdRole = Qt::UserRole + 1,
        PathRole
    };
    virtual int rowCount(const QModelIndex&) const { return m_files.size(); }
    virtual QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void addFile(QString path, int id);
    Q_INVOKABLE void readList();
    Q_INVOKABLE void storeList();
private:
    QList<file> m_files;
};


#endif // FILELIST_H
