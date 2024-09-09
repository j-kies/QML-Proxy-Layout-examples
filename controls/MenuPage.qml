import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material 2.12

ExamplePage {
    id: root

    signal exampleRequested(int exampleType)

    Material.theme: Material.Light
    Material.accent: Material.Indigo

    title: qsTr("Proxy layouts examples")
    backButtonVisible: false

    enum Pages {
        ButtonExample,
        ButtonExampleWithoutProxy1,
        ButtonExampleWithoutProxy2,
        NavigationExample,
        DynamicCreationExample,
        RtlExample,
        SelectiveLayoutExample,
        ControlsGalleryExample,
        DualLayoutAntiExample
    }

    ListView {
        id: contentList

        topMargin: 30
        bottomMargin: 30

        anchors {
            fill: parent
            leftMargin: 80
            rightMargin: 80
        }

        model: ListModel {
            ListElement {
                text: qsTr("Button example")
                isAntiExample: false
                type: MenuPage.ButtonExample
            }
            ListElement {
                text: qsTr("Button example without proxy layout 1")
                isAntiExample: false
                type: MenuPage.ButtonExampleWithoutProxy1
            }
            ListElement {
                text: qsTr("Button example without proxy layout 2")
                isAntiExample: false
                type: MenuPage.ButtonExampleWithoutProxy2
            }
            ListElement {
                text: qsTr("Navigation example")
                isAntiExample: false
                type: MenuPage.NavigationExample
            }
            ListElement {
                text: qsTr("Dynamic creation example")
                isAntiExample: false
                type: MenuPage.DynamicCreationExample
            }
            ListElement {
                text: qsTr("RTL language support example")
                isAntiExample: false
                type: MenuPage.RtlExample
            }
            ListElement {
                text: qsTr("Selective layout example")
                isAntiExample: false
                type: MenuPage.SelectiveLayoutExample
            }
            ListElement {
                text: qsTr("Controls gallery - case study")
                isAntiExample: false
                type: MenuPage.ControlsGalleryExample
            }
            ListElement {
                text: qsTr("ANTI EXAMPLE - Dual layout")
                isAntiExample: true
                type: MenuPage.DualLayoutAntiExample
            }
        }

        delegate: Button {
            width: ListView.view.width
            text: model.text
            highlighted: !model.isAntiExample

            onClicked: {
                root.exampleRequested(model.type)
            }
        }
    }
}
