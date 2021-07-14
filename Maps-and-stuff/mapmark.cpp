#include "mapmark.h"

#include <QString>
#include <QColor>
#include <QImage>
#include <QGeoCoordinate>
#include <QUuid>

MapMark::MapMark(QString name, QString image, QString note, QGeoCoordinate coord)
{
    this->name = name;
    this->image = image;
    this->note = note;
    this->coord = coord;
    double res = ((coord.latitude() + coord.longitude()) * (coord.latitude() * coord.latitude() + coord.longitude()  * coord.longitude()));
    this->id = QString::number(res);
}
