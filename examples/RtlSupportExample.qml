import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material 2.12
import ProxyLayouts

ExamplePage {
    id: root

    title: qsTr("RTL support")

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        visible: false
        spacing: 15

        LayoutMirroring.enabled: modeSwitch.checked
        LayoutMirroring.childrenInherit: true

        Item {
            id: topSpacer
            Layout.fillHeight: true
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignHCenter
            target: englishLabel
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignHCenter
            target: modeSwitch
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignHCenter
            target: arabicLabel
        }

        Item {
            id: bottomSpacer
            Layout.fillHeight: true
        }
    }

    RowLayout {
        id: rowLayout

        LayoutMirroring.enabled: modeSwitch.checked
        LayoutMirroring.childrenInherit: true

        anchors.fill: parent
        visible: false
        spacing: 15

        Item {
            id: leftSpacer
            Layout.fillWidth: true
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignVCenter
            target: englishLabel
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignVCenter
            target: modeSwitch
        }

        LayoutItemProxy {
            Layout.alignment: Qt.AlignVCenter
            target: arabicLabel
        }

        Item {
            id: rightSpacer
            Layout.fillWidth: true
        }
    }

    Text {
        id: englishLabel
        text: qsTr("English")
        font.pixelSize: 24
    }

    Text {
        id: arabicLabel
        text: qsTr("اَلْعَرَبِيَّةُ")
        font.pixelSize: 24
    }

    Switch {
        id: modeSwitch
        checked: false
    }

    RowLayout {
        id: flipIndicator

        LayoutMirroring.enabled: modeSwitch.checked
        LayoutMirroring.childrenInherit: true

        height: 100
        spacing: 15

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Item {
            Layout.fillWidth: true
        }

        Repeater {
            id: imageRepeater
            model: ["qrc:/assets/sky1.jpg", "qrc:/assets/sky2.jpg", "qrc:/assets/sky3.jpg"]

            delegate: Image {
                id: image1

                Layout.fillHeight: true
                Layout.maximumWidth: 100
                fillMode: Image.PreserveAspectCrop
                source: modelData

                Text {
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    font {
                        pixelSize: 30
                        bold: true
                    }
                    text: index
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }

    states: [
        State {
            name: "row"
            when: root.width >= 500
            PropertyChanges {
                target: columnLayout
                visible: false
            }
            PropertyChanges {
                target: rowLayout
                visible: true
            }
        },
        State {
            name: "column"
            when: root.width < 500
            PropertyChanges {
                target: columnLayout
                visible: true
            }
            PropertyChanges {
                target: rowLayout
                visible: false
            }
        }
    ]
}
