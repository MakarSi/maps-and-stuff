#include <QDir>
#include <QDebug>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardPaths>

#include "markstorer.h"
#include "mapmark.h"

namespace FSPrivate {
QString formDataMarkPath();
void createDataMarkPath();

QJsonObject convertMarkToJsonObject(MapMark &f);
MapMark convertJsonObjectToMark(QJsonObject &jsonObject);
};

QString FSPrivate::formDataMarkPath() {
    QDir dataDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    return dataDir.absoluteFilePath(QStringLiteral("marks.json"));
}

void FSPrivate::createDataMarkPath() {
    auto path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir directoryCreator;
    directoryCreator.mkpath(path);
}

MapMark FSPrivate::convertJsonObjectToMark(QJsonObject &jsonObject) {
    return MapMark(
                jsonObject["name"].toString(),
            jsonObject["image"].toString(),
            jsonObject["note"].toString(),
            QGeoCoordinate(
            jsonObject["lat"].toDouble(),
            jsonObject["long"].toDouble(),
            jsonObject["alt"].toDouble())
            );
}

QJsonObject FSPrivate::convertMarkToJsonObject(MapMark &f) {
    QJsonObject fileObject;
    fileObject["id"] = f.id;
    fileObject["name"] = f.name;
    fileObject["image"] = f.image;
    fileObject["note"] = f.note;
    fileObject["alt"] = f.coord.altitude();
    fileObject["lat"] = f.coord.latitude();
    fileObject["long"] = f.coord.longitude();
    return fileObject;
}

QList<MapMark> MarkStorer::readMark() {
    QList<MapMark> marks;
    qDebug() << "Data file path: " << FSPrivate::formDataMarkPath();
    QFile dataFile(FSPrivate::formDataMarkPath());
    if(!dataFile.exists()) {
        // Data does not exists
        return marks;
    }
    if(!dataFile.open(QFile::ReadOnly)) {
        // File could not be openned
        return marks;
    }
    auto rawData = dataFile.readAll();
    auto jsonDocument = QJsonDocument::fromJson(rawData);
    if(jsonDocument.isNull()) {
        // Data was not parsed
        return marks;
    }
    if(!jsonDocument.isArray()) {
        // Root element is not array
        return marks;
    }
    auto jsonArray = jsonDocument.array();
    foreach(QJsonValue arrayValue, jsonArray) {
        if(!arrayValue.isObject()) continue; // Element of the array is not an object
        auto jsonObject = arrayValue.toObject();
        marks.append(FSPrivate::convertJsonObjectToMark(jsonObject));
    }
    return marks;
}

void MarkStorer::storeMark(QList<MapMark> &m_marks) {
    QJsonArray jsonArray;
    foreach(MapMark f, m_marks) {
        jsonArray.append(FSPrivate::convertMarkToJsonObject(f));
    }
    QJsonDocument jsonDocument;
    jsonDocument.setArray(jsonArray);
    FSPrivate::createDataMarkPath();
    QFile dataFile(FSPrivate::formDataMarkPath());
    dataFile.open(QFile::WriteOnly);
    dataFile.write(jsonDocument.toJson(QJsonDocument::Indented));
    dataFile.close();
}
