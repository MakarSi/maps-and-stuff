#ifndef FILE_H
#define FILE_H

#include <QObject>
#include <QFileInfo>
#include <QStandardPaths>
#include <QDir>
#include <QDebug>

class file
{
public:
    file(QString oldPath, QString id) : markId(id)
    {
        auto dir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
        QFileInfo fInfo(oldPath);
        if (fInfo.path() == dir) { fileInfo = fInfo; return; }
        oldPath = fInfo.filePath();
        if (oldPath[0] == 'f') oldPath = oldPath.right(oldPath.size() - 7);

        QString name;
        QString short_name = fInfo.baseName();
        QString ext = fInfo.suffix();
        name = short_name + id + '.' + ext;

        QString newPath = dir + "/" + name;
        QFile f(newPath);
        f.open(QIODevice::Truncate | QIODevice::WriteOnly);

        QFile f_old(oldPath);
        f_old.open(QIODevice::ReadWrite);
        QByteArray data = f_old.readAll();
        //qDebug() << data << "\n";
        f_old.close();
        f.write(data);
        f.close();
        fileInfo = QFileInfo(newPath);
        qDebug() << oldPath << "\n" << newPath << "\n";
    }
    file(const file& f) : fileInfo(f.fileInfo), markId(f.markId)
    {

    }
    file() {}
    bool operator== (const file& other)
    {
        return fileInfo == other.fileInfo &&
                markId == other.markId;
    }
    QFileInfo fileInfo = QFileInfo();
    QString markId = "";
};

#endif // FILE_H
