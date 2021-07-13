#ifndef MAPLIST_H
#define MAPLIST_H

#include <QAbstractListModel>
#include <QList>
#include "mapmark.h"

class MarkList : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit MarkList(QObject *parent=nullptr);

    // Mark list
    enum MarkRoles {
        IdRole,
        NameRole,
        ImageRole,
        NoteRole,
        AltRole,
        LongRole,
        LatRole
    };
    virtual int rowCount(const QModelIndex&) const { return m_marks.size(); }
    virtual QVariant data(const QModelIndex &index, int role) const;

    QHash<int, QByteArray> roleNames() const;
    Q_INVOKABLE void addMark(QString, QString, QString, QGeoCoordinate);
    Q_INVOKABLE void readMark();
    Q_INVOKABLE void storeMark();
    QList<MapMark> m_marks;
};

#endif // MAPLIST_H
