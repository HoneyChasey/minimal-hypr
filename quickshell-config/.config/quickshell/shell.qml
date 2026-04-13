import Quickshell // for PanelWindow
import QtQuick // for Text

TYPE99MQS_Quickshell99NPanelWindow99TYPE {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30

  TYPE99MQT_qml_QtQuick99NText99TYPE {
    // center the bar in its parent component (the window)
    anchors.centerIn: parent

    text: "hello world"
  }
}
