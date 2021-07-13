#include "mapmark.h"

#include <QString>
#include <QColor>
#include <QImage>
#include <QGeoCoordinate>
#include <QUuid>

MapMark::MapMark(QString name, QString image, QString note, QGeoCoordinate coord)
{
    this->id = QUuid::createUuid().toString();
    this->name = name;
    this->image = image;
    this->note = note;
    this->coord = coord;
}
