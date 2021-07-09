#ifndef FILESTORER_H
#define FILESTORER_H

#include <QObject>
#include "file.h"

namespace FileStorer
{
    QList<file> readFile();
    void storeFile(QList<file> &files);
}

#endif // FILESTORER_H
