#ifndef MAPMARK_H
#define MAPMARK_H

#include <QString>
#include <QColor>
#include <QImage>
#include <QGeoCoordinate>
#include <QUuid>

struct MapMark{
    MapMark(QString, QString, QString, double, double, double);
    QString id;
    QString name;
    QString image;
    QString note;
    QGeoCoordinate coord;
};

#endif // MAPMARK_H
