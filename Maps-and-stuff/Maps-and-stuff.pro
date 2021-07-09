# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = Maps-and-stuff

CONFIG += sailfishapp

QT += multimedia
QT += positioning
QT += location
QT += core

SOURCES += src/Maps-and-stuff.cpp \
    file.cpp \
    filelist.cpp \
    filestorer.cpp \
    mapmark.cpp \
    marklist.cpp \
    markstorer.cpp

DISTFILES += qml/Maps-and-stuff.qml \
    ../git_proj/maps-and-stuff/MyMap/qml/pages/ListPage.qml \
    ../git_proj/maps-and-stuff/MyMap/qml/pages/MapPage.qml \
    qml/cover/CoverPage.qml \
    qml/pages/ListPage.qml \
    qml/pages/MapPage.qml \
    rpm/Maps-and-stuff.changes.in \
    rpm/Maps-and-stuff.changes.run.in \
    rpm/Maps-and-stuff.spec \
    rpm/Maps-and-stuff.yaml \
    translations/*.ts \
    Maps-and-stuff.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/Maps-and-stuff-de.ts

HEADERS += \
    file.h \
    filelist.h \
    filestorer.h \
    mapmark.h \
    marklist.h \
    markstorer.h
