import Quickshell
import Quickshell.Widgets

Shell {
  id: root
  Window {
    anchors.top: true
    anchors.left: true
    anchors.right: true
    height: 30
    
    color: "#282a36"

    Text {
      anchors.centerIn: parent
      text: "Hello from Quickshell on NixOS!"
      color: "#f8f8f2"
    }
  }
}
