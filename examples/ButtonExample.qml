import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.12
import ProxyLayouts

ExamplePage {
    id: root

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    title: qsTr("Buttons - try shrinking the window!")

    ColumnLayout {
        id: column

        anchors.fill: parent
        visible: root.width < 450

        LayoutItemProxy {
            target: button1
        }

        LayoutItemProxy {
            target: button2
        }
    }

    RowLayout {
        id: row

        anchors.fill: parent
        visible: root.width >= 450

        LayoutItemProxy {
            target: button2
        }

        LayoutItemProxy {
            target: button1
        }
    }

    Button {
        id: button1
        Layout.fillWidth: true
        Layout.fillHeight: true
        text: "Hello"
    }

    Button {
        id: button2
        Layout.fillWidth: true
        Layout.fillHeight: true
        text: "world"
    }
}
