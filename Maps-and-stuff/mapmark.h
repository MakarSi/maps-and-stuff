#ifndef MAPMARK_H
#define MAPMARK_H

#include <QString>
#include <QColor>
#include <QImage>

struct MapMark{
    MapMark(int, QString, QColor, QImage, QString, double, double);
    int id;
    QString name;
    QColor color;
    QImage image;
    QString note;
    double x_coord, y_coord;
    //list of files??
};

#endif // MAPMARK_H
