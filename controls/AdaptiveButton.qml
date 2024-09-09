import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.12

AbstractButton {
    id: root

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    background: Rectangle {
        color: "#4646be"
        radius: 15
    }

    topPadding: 5
    bottomPadding: 5
    leftPadding: 20
    rightPadding: 20

    icon.width: 30
    icon.height: 30
    icon.color: "white"

    contentItem: Item {
        id: contentWrapper
        anchors.fill: parent
        opacity: root.down ? 0.6 : 1.0
        RowLayout {
            anchors {
                fill: parent
                topMargin: root.topPadding
                bottomMargin: root.bottomPadding
                leftMargin: root.leftPadding
                rightMargin: root.rightPadding
            }
            visible: root.width >= 250
            spacing: 5
            LayoutItemProxy {
                target: iconObj
                Layout.alignment: Qt.AlignHCenter
            }
            LayoutItemProxy {
                target: textObj
                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
            }
        }

        ColumnLayout {
            anchors {
                fill: parent
                topMargin: root.topPadding
                bottomMargin: root.bottomPadding
                leftMargin: root.leftPadding
                rightMargin: root.rightPadding
            }
            visible: root.width <= 250 && root.height >= 80
            spacing: 5

            LayoutItemProxy {
                target: iconObj
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            }

            LayoutItemProxy {
                target: textObj
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        ColumnLayout {
            id: textOnly
            anchors {
                fill: parent
                topMargin: root.topPadding
                bottomMargin: root.bottomPadding
                leftMargin: root.leftPadding
                rightMargin: root.rightPadding
            }
            visible: root.width <= 250 && root.width >= 80 && root.height < 80

            LayoutItemProxy {
                target: textObj
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        ColumnLayout {
            id: iconOnly
            anchors {
                fill: parent
                topMargin: root.topPadding
                bottomMargin: root.bottomPadding
                leftMargin: root.leftPadding
                rightMargin: root.rightPadding
            }
            visible: root.width < 80 && root.height < 80

            LayoutItemProxy {
                target: iconObj
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            }
        }

        IconLabel {
            id: iconObj
            icon: root.icon
            display: IconLabel.IconOnly
        }

        Text {
            id: textObj
            text: root.text
            color: icon.color
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            elide: Text.ElideRight
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 250
            }
        }
    }
}
