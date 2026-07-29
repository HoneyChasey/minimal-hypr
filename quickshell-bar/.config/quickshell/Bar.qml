// Bar composing
import QtQuick
import Quickshell
import Quickshell.Hyprland
PanelWindow {
    required property var modelData
    screen: modelData
    anchors { top: true; left: true; right: true }
    implicitHeight: 34
    color: "#1e1e2e"
    Logo {
        id: logo
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.verticalCenter: parent.verticalCenter
    }
    Workspaces {
        anchors.left: logo.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }
    WindowTitle {
        anchors.centerIn: parent
    }
    Clock {
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
    }
}
