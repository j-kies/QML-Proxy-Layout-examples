import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material 2.12
import ProxyLayouts

ExamplePage {
    id: root
    title: qsTr("ANTI EXAMPLE - Dual proxy")

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: Math.max(gridLayout.height, columnLayout.height)

        ColumnLayout {
            id: columnLayout

            anchors {
                left: parent.left
                right: parent.horizontalCenter
                top: parent.top
            }
            LayoutItemProxy {
                target: image1
            }
            LayoutItemProxy {
                target: image2
            }
            LayoutItemProxy {
                target: image3
            }
            LayoutItemProxy {
                target: image4
            }
        }

        GridLayout {
            id: gridLayout

            columns: 2

            anchors {
                left: parent.horizontalCenter
                right: parent.right
                top: parent.top
            }

            LayoutItemProxy {
                target: image1
            }
            LayoutItemProxy {
                target: image2
            }
            LayoutItemProxy {
                target: image3
            }
            LayoutItemProxy {
                target: image4
            }
        }
    }

    Image {
        id: image1

        Layout.preferredHeight: 250
        Layout.preferredWidth: 250

        fillMode: Image.PreserveAspectCrop
        source: "qrc:/assets/sky1.jpg"
    }
    Image {
        id: image2

        Layout.preferredHeight: 250
        Layout.preferredWidth: 250

        fillMode: Image.PreserveAspectCrop
        source: "qrc:/assets/sky2.jpg"
    }
    Image {
        id: image3

        Layout.preferredHeight: 250
        Layout.preferredWidth: 250

        fillMode: Image.PreserveAspectCrop
        source: "qrc:/assets/sky3.jpg"
    }
    Image {
        id: image4

        Layout.preferredHeight: 250
        Layout.preferredWidth: 250

        fillMode: Image.PreserveAspectCrop
        source: "qrc:/assets/sky4.jpg"
    }
}
