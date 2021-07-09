#include "mapmark.h"


#include <QString>
#include <QColor>
#include <QImage>

MapMark::MapMark(int id, QString name, QColor color, QImage image, QString note, double x_coord, double y_coord)
{
    this->id = id; //hash func shoul be here
    this->name = name;
    this->color = color;
    this->image = image;
    this->note = note;
    this->x_coord = x_coord;
    this->y_coord = y_coord;
}
