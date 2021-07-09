//#ifndef MARKSTORER_H
//#define MARKSTORER_H
//#include <QList>
//#include <QString>
//#include "mapmark.h"

//namespace MarkStorer {
//    QList<MapMark> readData();
//    void storeData(QList<MapMark> &marks);
//};

//#endif // MARKSTORER_H

//#include <QDir>
//#include <QDebug>
//#include <QFile>
//#include <QJsonArray>
//#include <QJsonDocument>
//#include <QJsonObject>
//#include <QStandardPaths>

//#include "markstorer.h"
//#include "mapmark.h"

//namespace DSPrivate {
//    QString formDataFilePath();
//    void createDataPath();

//    QJsonObject convertNoteToJsonObject(Note &note);
//    Note convertJsonObjectToNote(QJsonObject &jsonObject);
//};

//QString DSPrivate::formDataFilePath() {
//    QDir dataDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
//    return dataDir.absoluteFilePath(QStringLiteral("data.json"));
//}

//void DSPrivate::createDataPath() {
//    auto path = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
//    QDir directoryCreator;
//    directoryCreator.mkpath(path);
//}

//Note DSPrivate::convertJsonObjectToNote(QJsonObject &jsonObject) {
//    return Note(
//        jsonObject["name"].toString(),
//        jsonObject["text"].toString()
//    );
//}

//QJsonObject DSPrivate::convertNoteToJsonObject(Note &note) {
//    QJsonObject noteObject;
//    noteObject["name"] = note.name;
//    noteObject["text"] = note.text;
//    return noteObject;
//}

//QList<Note> DataStorer::readData() {
//    QList<Note> notes;
//    qDebug() << "Data file path: " << DSPrivate::formDataFilePath();
//    QFile dataFile(DSPrivate::formDataFilePath());
//    if(!dataFile.exists()) {
//        // Data does not exists
//        return notes;
//    }
//    if(!dataFile.open(QFile::ReadOnly)) {
//        // File could not be openned
//        return notes;
//    }
//    auto rawData = dataFile.readAll();
//    auto jsonDocument = QJsonDocument::fromJson(rawData);
//    if(jsonDocument.isNull()) {
//        // Data was not parsed
//        return notes;
//    }
//    if(!jsonDocument.isArray()) {
//        // Root element is not array
//        return notes;
//    }
//    auto jsonArray = jsonDocument.array();
//    foreach(QJsonValue arrayValue, jsonArray) {
//        if(!arrayValue.isObject()) continue; // Element of the array is not an object
//        auto jsonObject = arrayValue.toObject();
//        notes.append(DSPrivate::convertJsonObjectToNote(jsonObject));
//    }
//    return notes;
//}

//void DataStorer::storeData(QList<Note> &notes) {
//    QJsonArray jsonArray;
//    foreach(Note note, notes) {
//        jsonArray.append(DSPrivate::convertNoteToJsonObject(note));
//    }
//    QJsonDocument jsonDocument;
//    jsonDocument.setArray(jsonArray);
//    DSPrivate::createDataPath();
//    QFile dataFile(DSPrivate::formDataFilePath());
//    dataFile.open(QFile::WriteOnly);
//    dataFile.write(jsonDocument.toJson(QJsonDocument::Indented));
//    dataFile.close();
//}
