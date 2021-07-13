#ifndef MARKSTORER_H
#define MARKSTORER_H

#include <QObject>
#include "mapmark.h"

namespace MarkStorer
{
    QList<MapMark> readMark();
    void storeMark(QList<MapMark> &m_marks);
}

#endif // MARKSTORER_H
