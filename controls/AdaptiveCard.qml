import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.12

Pane {
    id: root

    property string title

    Material.elevation: 10

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    Label {
        id: titleLabel
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        text: root.title
        verticalAlignment: Label.AlignVCenter
        color: "black"
        font {
            pixelSize: 16
            bold: true
        }
    }

    StackLayout {
        id: stack
        visible: root.width < 400
        anchors {
            top: titleLabel.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 15
        }

        LayoutItemProxy {
            target: instructionsText

            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        LayoutItemProxy {
            target: instructionImage
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    RowLayout {
        id: row
        visible: root.width >= 400
        anchors {
            top: titleLabel.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 15
        }

        LayoutItemProxy {
            target: instructionsText

            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Rectangle {
            id: separator

            Layout.fillHeight: true
            Layout.preferredWidth: 1
            color: "#4646be"
        }

        LayoutItemProxy {
            target: instructionImage
            Layout.fillHeight: true
            Layout.maximumWidth: instructionImage.height
        }
    }

    Text {
        id: instructionsText
        text: "Some instructions on how to do stuff. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        wrapMode: Text.Wrap
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    Image {
        id: instructionImage
        fillMode: Image.PreserveAspectFit
        source: "qrc:/assets/sky6.jpg"
    }

    AdaptiveButton {
        id: tinyButton

        anchors {
            bottom: parent.bottom
            right: parent.right
            margins: 2
        }

        visible: stack.visible

        width: 50
        height: 50

        topPadding: 5
        bottomPadding: 5
        leftPadding: 5
        rightPadding: 5

        icon.source: "qrc:/assets/icons/arrow-circle-right-svgrepo-com.svg"

        onClicked: {
            if (stack.currentIndex === 1) {
                stack.currentIndex = 0
            } else {
                stack.currentIndex = 1
            }
        }
    }
}
