#include <QDir>
#include <QDebug>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardPaths>

#include "filestorer.h"
#include "file.h"

namespace FSPrivate {
    QString formDataFilePath();
    void createDataPath();

    QJsonObject convertNoteToJsonObject(file &f);
    file convertJsonObjectToNote(QJsonObject &jsonObject);
};

QString FSPrivate::formDataFilePath() {
    QDir dataDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    return dataDir.absoluteFilePath(QStringLiteral("files.json"));
}

void FSPrivate::createDataPath() {
    auto path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir directoryCreator;
    directoryCreator.mkpath(path);
}

file FSPrivate::convertJsonObjectToNote(QJsonObject &jsonObject) {
    return file(
        jsonObject["path"].toString(),
        jsonObject["id"].toInt()
    );
}

QJsonObject FSPrivate::convertNoteToJsonObject(file &f) {
    QJsonObject fileObject;
    fileObject["id"] = f.markId;
    fileObject["path"] = f.filePath;
    return fileObject;
}

QList<file> FileStorer::readFile() {
    QList<file> files;
    qDebug() << "Data file path: " << FSPrivate::formDataFilePath();
    QFile dataFile(FSPrivate::formDataFilePath());
    if(!dataFile.exists()) {
        // Data does not exists
        return files;
    }
    if(!dataFile.open(QFile::ReadOnly)) {
        // File could not be openned
        return files;
    }
    auto rawData = dataFile.readAll();
    auto jsonDocument = QJsonDocument::fromJson(rawData);
    if(jsonDocument.isNull()) {
        // Data was not parsed
        return files;
    }
    if(!jsonDocument.isArray()) {
        // Root element is not array
        return files;
    }
    auto jsonArray = jsonDocument.array();
    foreach(QJsonValue arrayValue, jsonArray) {
        if(!arrayValue.isObject()) continue; // Element of the array is not an object
        auto jsonObject = arrayValue.toObject();
        files.append(FSPrivate::convertJsonObjectToNote(jsonObject));
    }
    return files;
}

void FileStorer::storeFile(QList<file> &notes) {
    QJsonArray jsonArray;
    foreach(file f, notes) {
        jsonArray.append(FSPrivate::convertNoteToJsonObject(f));
    }
    QJsonDocument jsonDocument;
    jsonDocument.setArray(jsonArray);
    FSPrivate::createDataPath();
    QFile dataFile(FSPrivate::formDataFilePath());
    dataFile.open(QFile::WriteOnly);
    dataFile.write(jsonDocument.toJson(QJsonDocument::Indented));
    dataFile.close();
}
