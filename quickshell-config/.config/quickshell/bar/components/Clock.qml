import QtQuick

Text {
    id: clockText
    text: " " + Qt.formatDateTime(new Date(), "hh:mm")
    color: "black"
    font.pixelSize: 15
    //font.family: Theme.fontFamily
    font.bold: true

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clockText.text = " " + Qt.formatDateTime(new Date(), "hh:mm")
    }
}
