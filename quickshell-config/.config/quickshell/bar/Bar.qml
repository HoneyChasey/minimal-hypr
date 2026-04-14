// bar/Bar.qml
import Quickshell
import Quickshell.Io
import QtQuick

import qs.bar.components


Variants {
  model: Quickshell.screens
  delegate: Component {
    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 35

      // left 
      Logo {
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
      }

      // Rright
      Power {
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
      }
    
      // Centre
      Clock { // Import the code inside the Clock.qml 
        anchors.centerIn: parent
      }
    }
  }
}
