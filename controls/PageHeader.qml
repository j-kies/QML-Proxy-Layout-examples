import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material 2.12

Rectangle {
    id: root

    property alias backButtonVisible: backButton.visible
    property alias headerTitle: titleLabel.text

    signal backButtonPressed

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    implicitWidth: 640
    implicitHeight: 64
    color: "#4646be"
    RowLayout {
        anchors.fill: parent
        spacing: 0
        Button {
            id: backButton
            Layout.fillHeight: true
            Layout.preferredWidth: backButton.height
            Material.theme: Material.Dark
            text: "<"
            flat: true

            onClicked: {
                root.backButtonPressed()
            }
        }

        Label {
            id: titleLabel
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 20

            text: root.title
            verticalAlignment: Label.AlignVCenter
            color: "white"
            font {
                pixelSize: 16
                bold: true
            }
        }
    }
}
