#ifndef MAPMARK_H
#define MAPMARK_H

#include <QString>
#include <QColor>
#include <QImage>
#include <QGeoCoordinate>
#include <QUuid>

class MapMark{
public:
    MapMark(QString, QString, QString, QGeoCoordinate);
    MapMark(QGeoCoordinate coord){
        this->id = QUuid::createUuid().toString();
        this->name = "name";
        this->image = "image";
        this->note = "note";
        this->coord = coord;
    }
    QString id;
    QString name;
    QString image;
    QString note;
    QGeoCoordinate coord;
    bool operator==(const MapMark& m){
        if (this->coord.latitude() == m.coord.latitude()
                && this->coord.longitude() == m.coord.longitude())
            return true;
        else return false;
    }
};

#endif // MAPMARK_H
