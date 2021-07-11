#ifndef MAPMARK_H
#define MAPMARK_H

#include <QString>
#include <QColor>
#include <QImage>
#include <QGeoCoordinate>

struct MapMark{
    MapMark(int, QString, QString, QString, double, double, double);
    int id;
    QString name;
    QString image;
    QString note;
    QGeoCoordinate coord;
};

#endif // MAPMARK_H
