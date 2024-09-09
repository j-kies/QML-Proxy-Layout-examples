import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material 2.12
import ProxyLayouts

ExamplePage {
    id: root
    title: qsTr("Dynamic proxy")

    readonly property bool usingWideLayout: root.width >= 400

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: root.usingWideLayout ? gridLayout.height : columnLayout.height

        ColumnLayout {
            id: columnLayout

            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }

            visible: !root.usingWideLayout

            Repeater {
                model: _private.imagesList
                delegate: LayoutItemProxy {
                    Layout.alignment: Qt.AlignHCenter
                    target: modelData
                }
            }
        }

        GridLayout {
            id: gridLayout

            columns: 3

            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
            visible: root.usingWideLayout

            Repeater {
                model: _private.imagesList
                delegate: LayoutItemProxy {
                    target: modelData
                }
            }
        }
    }

    QtObject {
        id: _private
        property list<var> imagesList: []
    }

    Repeater {
        id: imageRepeater

        model: ["qrc:/assets/sky1.jpg", "qrc:/assets/sky2.jpg", "qrc:/assets/sky3.jpg", "qrc:/assets/sky4.jpg", "qrc:/assets/sky5.jpg", "qrc:/assets/sky6.jpg"]

        delegate: Image {
            Layout.preferredHeight: 250
            Layout.preferredWidth: 250

            fillMode: Image.PreserveAspectCrop
            source: modelData
        }

        onItemAdded: function (index, item) {
            _private.imagesList.push(item)
        }

        onItemRemoved: function (index, item) {
            let itemIndex = _private.imagesList.indexOf(item)
            _private.imagesList.splice(itemIndex, 1)
        }
    }
}
