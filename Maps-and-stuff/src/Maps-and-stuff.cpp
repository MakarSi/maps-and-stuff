#ifdef QT_QML_DEBUG
#endif
#include <QtQuick>
#include <sailfishapp.h>

#include "filelist.h"
#include "marklist.h"

int main(int argc, char *argv[])
{
    // SailfishApp::main() will display "qml/%ProjectName%.qml", if you need more
    // control over initialization, you can use:
    //
    //   - SailfishApp::application(int, char *[]) to get the QGuiApplication *
    //   - SailfishApp::createView() to get a new QQuickView * instance
    //   - SailfishApp::pathTo(QString) to get a QUrl to a resource file
    //   - SailfishApp::pathToMainQml() to get a QUrl to the main QML file
    //
    // To display the view, call "show()" (will show fullscreen on device).

    qRegisterMetaType<FileList*>("FileList");
    qmlRegisterType<FileList>("MyMap", 1, 0, "FileList");
    qmlRegisterType<MarkList>("MyMap", 1, 0, "MarkList");
    return SailfishApp::main(argc, argv);
}
