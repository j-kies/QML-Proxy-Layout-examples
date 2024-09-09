import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12

Page {
    id: root

    property bool backButtonVisible: true

    signal backButtonPressed

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    header: PageHeader {
        backButtonVisible: root.backButtonVisible
        headerTitle: root.title

        onBackButtonPressed: root.backButtonPressed()
    }
}
