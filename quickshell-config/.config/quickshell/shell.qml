import Quickshell
import Quickshell.Io
import QtQuick

Variants {
  model: Quickshell.screens; // one windows for one screen 

  delegate: Component {
    PanelWindow { // this is the waybar, the panel 
      // the screen from the screens list will be injected into this
      // property
      required property var modelData // This is the screen injected by variant

      // we can then set the window's screen to the injected property
      screen: modelData

      anchors { // Ths is the config of how is display the Quickshell. At the top to the left to the right
        top: true
        left: true
        right: true
      }
 
      implicitHeight: 35 // The height in px of the bar

      // Left text
      Text {
        id: archlogo
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter // This is to center in veritcial, text, it's like the padding on the top and buttom of the parrent.
        text: "󰣇"
        font.pixelSize: 25
        color: "purple"

      }
      

      // center text
      Text {
        id: clock
        anchors.centerIn: parent // It's littelary: center me in your parent. So here we display the date at the center of the parent, who is the anchors.
        font.pixelSize: 20

        Process {
          id: dateProc
          command: ["date", "+%R"]
          running: true

          stdout: StdioCollector {
            onStreamFinished: clock.text = this.text // onStreamFinished = when finish process's clock, triggered. clock.text = property's text of text id clock. this = StdioCollector and .text = what is collected in the Stdout at the beginning of the process.
          }
        }

        Timer {
          interval: 1000
          running: true
          repeat: true
          onTriggered: dateProc.running = true
        }
      }
    }
  }
}
