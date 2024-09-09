import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.12
import ProxyLayouts

ExamplePage {
    id: root

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    title: qsTr("Buttons no proxy & loader - try shrinking the window!")

    ColumnLayout {
        id: column

        anchors.fill: parent
        visible: root.width < 450

        Loader {
            id: button1Loader
            active: parent.visible

            Layout.fillWidth: true
            Layout.fillHeight: true

            sourceComponent: Button {
                id: button1
                text: "Hello"
            }
        }

        Loader {
            id: button2Loader
            Layout.fillWidth: true
            Layout.fillHeight: true
            sourceComponent: Button {
                id: button2
                text: "world"
            }
        }
    }

    RowLayout {
        id: row

        anchors.fill: parent
        visible: root.width >= 450

        Loader {
            id: button3Loader
            active: parent.visible
            Layout.fillWidth: true
            Layout.fillHeight: true
            sourceComponent: Button {
                id: button3
                text: "Hello"
            }
        }

        Loader {
            id: button4Loader
            active: parent.visible
            Layout.fillWidth: true
            Layout.fillHeight: true
            sourceComponent: Button {
                id: button4
                text: "world"
            }
        }
    }
}
