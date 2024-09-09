import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.12
import ProxyLayouts

ExamplePage {
    id: root

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    title: qsTr("Adaptive controls")

    Flickable {
        id: pageFlickable
        anchors.fill: parent
        contentHeight: contentLayout.height
        topMargin: 40

        ColumnLayout {
            id: contentLayout

            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            spacing: 25

            AdaptiveButton {
                id: wideButton
                Layout.preferredHeight: 45
                Layout.preferredWidth: 300
                Layout.alignment: Qt.AlignHCenter

                text: "I'm wide!"
                icon.source: "qrc:/assets/icons/cloud-bolt-svgrepo-com.svg"
            }

            AdaptiveButton {
                id: narrowButton
                Layout.preferredHeight: 100
                Layout.preferredWidth: 100
                Layout.alignment: Qt.AlignHCenter

                topPadding: 10
                bottomPadding: 10

                text: "I'm narrow!"
                icon.source: "qrc:/assets/icons/snow-alt-1-svgrepo-com.svg"
            }

            AdaptiveButton {
                id: smallButton
                Layout.preferredHeight: 40
                Layout.preferredWidth: 120
                Layout.alignment: Qt.AlignHCenter

                text: "I'm small!"
                icon.source: "qrc:/assets/icons/snow-alt-1-svgrepo-com.svg"
            }

            AdaptiveButton {
                id: tinyButton
                Layout.preferredHeight: 50
                Layout.preferredWidth: 50
                Layout.alignment: Qt.AlignHCenter

                topPadding: 5
                bottomPadding: 5
                leftPadding: 5
                rightPadding: 5

                text: "I'm tiny!"
                icon.source: "qrc:/assets/icons/cloud-rainbow-svgrepo-com.svg"
            }

            AdaptiveCard {
                id: cardWide
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 600
                Layout.preferredHeight: 300
                title: "Some instructions"
            }

            AdaptiveCard {
                id: cardNarrow
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 300
                Layout.preferredHeight: 300
                title: "Some instructions"
            }
        }
    }
}
