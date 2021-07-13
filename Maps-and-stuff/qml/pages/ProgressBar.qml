import QtQuick 2.0

Rectangle {
    id: progressbar
    color: "black"
    opacity: 0.5
    property alias label: textArea.text

    /*!
        The minimum value of the ProgressBar range.
        The \l value must not be less than this value.
    */
    property int minimum: 0

    /*!
        The maximum value of the ProgressBar range.
        The \l value must not be more than this value.
    */
    property int maximum: 100

    /*!
        The value of the progress.
    */
    property int value: 0

    /*!
       \qmlproperty color ProgressBar::color
       The color of the ProgressBar's gradient. Must bind to a color type.

       \omit
           The "\qmlproperty <type> <property name>" is needed because
           property alias need to have their types manually entered.

           QDoc will not publish the documentation within omit and endomit.
       \endomit

       \sa secondColor
    */
    property alias color: gradient1.color

    /*!
       \qmlproperty color ProgressBar::secondColor
       The second color of the ProgressBar's gradient.
       Must bind to a color type.

       \omit
           The "\qmlproperty <type> <property name>" is needed because
           property alias need to have their types manually entered.

           QDoc will not publish the documentation within omit and endomit.
       \endomit

        \sa color
    */
    property alias secondColor: gradient2.color

    width: 250; height: 23
    clip: true

    Rectangle {
        id: highlight

        /*!
            An internal documentation comment. The widthDest property is not
            a public API and therefore will not be exposed.
        */
        property int widthDest: ((progressbar.width * (value - minimum)) / (maximum - minimum) - 6)

        width: highlight.widthDest
        Behavior on width { SmoothedAnimation { velocity: 1200 } }

        anchors { left: parent.left; top: parent.top; bottom: parent.bottom; margins: 3 }
        radius: 1
        gradient: Gradient {
            GradientStop { id: gradient1; position: 0.0 }
            GradientStop { id: gradient2; position: 1.0 }
        }

    }
    Text {
        id: textArea
        anchors { right: highlight.right; rightMargin: 6; verticalCenter: parent.verticalCenter }
        color: "white"
        font.bold: true
        text: Math.floor((value - minimum) / (maximum - minimum) * 100) + '%'
    }
}
