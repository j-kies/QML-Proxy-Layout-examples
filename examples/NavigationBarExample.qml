import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material 2.12
import ProxyLayouts

ExamplePage {
    id: root

    title: qsTr("Navigation")

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    Rectangle {
        id: navigationBackground
        color: "#4646be"
    }

    ColumnLayout {
        id: sideLayout
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
        width: 100
        visible: false

        LayoutItemProxy {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            target: homeButton
        }

        LayoutItemProxy {
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            target: settingsButton
        }

        Item {
            id: bottomSpacer
            Layout.fillHeight: true
        }
    }

    RowLayout {
        id: bottomLayout

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        height: 80
        visible: false

        Item {
            id: leftSpacer
            Layout.fillWidth: true
        }

        LayoutItemProxy {
            Layout.fillHeight: true
            Layout.preferredWidth: 80
            target: homeButton
        }

        LayoutItemProxy {
            Layout.fillHeight: true
            Layout.preferredWidth: 80
            target: settingsButton
        }

        Item {
            id: rightSpacer
            Layout.fillWidth: true
        }
    }

    Button {
        id: homeButton
        Material.theme: Material.Dark
        text: String.fromCharCode(0x2302)
        flat: true
        font.pixelSize: 20
    }

    Button {
        id: settingsButton
        Material.theme: Material.Dark
        text: String.fromCharCode(0x2699)
        flat: true
        font.pixelSize: 20
    }

    states: [
        State {
            name: "leftNavigation"
            when: root.width >= 600
            PropertyChanges {
                target: sideLayout
                visible: true
            }
            PropertyChanges {
                target: bottomLayout
                visible: false
            }
            PropertyChanges {
                target: navigationBackground
                anchors.fill: sideLayout
            }
        },
        State {
            name: "bottomNavigation"
            when: root.width < 600
            PropertyChanges {
                target: sideLayout
                visible: false
            }
            PropertyChanges {
                target: bottomLayout
                visible: true
            }
            PropertyChanges {
                target: navigationBackground
                anchors.fill: bottomLayout
            }
        }
    ]
}
