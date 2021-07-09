#ifndef FILE_H
#define FILE_H

#include <QObject>
#include <QFileInfo>
#include <QStandardPaths>
#include <QDir>

class file
{
public:
    file(QString oldPath, int id) : markId(id)
    {
        QFile f(oldPath);
        QFileInfo fInfo(f);
        QString name = fInfo.fileName();
        auto dir = QStandardPaths::AppDataLocation;
        QString newPath = dir + name;
        QFile::copy(oldPath, newPath);
    }
    QFileInfo fileInfo;
    QString filePath;
    int markId;
};

#endif // FILE_H
