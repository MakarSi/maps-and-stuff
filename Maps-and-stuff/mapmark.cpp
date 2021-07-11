#include "mapmark.h"

#include <QString>
#include <QColor>
#include <QImage>
#include <QGeoCoordinate>

MapMark::MapMark(int id, QString name, QString image, QString note,
                 double altitude, double latitude, double longtitude)
{
    this->id = id; //hash func shoul be here
    this->name = name;
    this->image = image;
    this->note = note;
    this->coord.setAltitude(altitude);
    this->coord.setLatitude(latitude);
    this->coord.setLongitude(longtitude);
}
