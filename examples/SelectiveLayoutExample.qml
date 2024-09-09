import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.12
import ProxyLayouts

ExamplePage {
    id: root

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    title: qsTr("Selective layout - try shrinking the window!")

    ColumnLayout {
        id: column

        anchors.fill: parent
        visible: root.width < 450
        spacing: 20

        LayoutItemProxy {
            target: image1
        }

        LayoutItemProxy {
            target: image3
        }
    }

    RowLayout {
        id: row

        spacing: 20

        anchors.fill: parent
        visible: root.width >= 450

        LayoutItemProxy {
            target: image2
        }

        LayoutItemProxy {
            target: image1
        }
    }

    Image {
        id: image1

        Layout.fillHeight: true
        Layout.fillWidth: true
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/assets/sky1.jpg"

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font {
                pixelSize: 40
                bold: true
            }
            text: "1"
        }
    }
    Image {
        id: image2

        Layout.fillHeight: true
        Layout.fillWidth: true

        fillMode: Image.PreserveAspectCrop
        source: "qrc:/assets/sky2.jpg"

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font {
                pixelSize: 40
                bold: true
            }
            text: "2"
        }
    }
    Image {
        id: image3

        Layout.fillHeight: true
        Layout.fillWidth: true

        fillMode: Image.PreserveAspectCrop
        source: "qrc:/assets/sky3.jpg"

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font {
                pixelSize: 40
                bold: true
            }
            text: "3"
        }
    }
}
