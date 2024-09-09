import QtQuick
import QtQuick.Controls
import ProxyLayouts

Window {
    id: root
    width: 800
    height: 640
    visible: true
    title: qsTr("QML Proxy Layouts examples")

    StackView {
        id: mainStack
        anchors.fill: parent
        initialItem: menuPageComponent

        onCurrentItemChanged: {
            if (mainStack.depth > 1) {
                mainStack.currentItem.backButtonPressed?.connect(() => {
                                                                     mainStack.pop()
                                                                 })
            }
        }
    }

    Component {
        id: menuPageComponent
        MenuPage {
            onExampleRequested: function (exampleType) {
                switch (exampleType) {
                case MenuPage.ButtonExample:
                    mainStack.push(buttonExampleComponent)
                    break
                case MenuPage.ButtonExampleWithoutProxy1:
                    mainStack.push(buttonExampleNoProxyComponent)
                    break
                case MenuPage.ButtonExampleWithoutProxy2:
                    mainStack.push(buttonExampleNoProxyLoaderComponent)
                    break
                case MenuPage.NavigationExample:
                    mainStack.push(navigationExampleComponent)
                    break
                case MenuPage.DynamicCreationExample:
                    mainStack.push(dynamicCreationExampleComponent)
                    break
                case MenuPage.RtlExample:
                    mainStack.push(rtlExampleComponent)
                    break
                case MenuPage.SelectiveLayoutExample:
                    mainStack.push(selectiveExampleComponent)
                    break
                case MenuPage.ControlsGalleryExample:
                    mainStack.push(controlsGalleryExampleComponent)
                    break
                case MenuPage.DualLayoutAntiExample:
                    mainStack.push(dualLayoutAntiExampleComponent)
                    break
                }
            }
        }
    }

    Component {
        id: buttonExampleComponent

        ButtonExample {}
    }

    Component {
        id: buttonExampleNoProxyComponent

        ButtonExampleWithoutProxy1 {}
    }
    Component {
        id: buttonExampleNoProxyLoaderComponent

        ButtonExampleWithoutProxy2 {}
    }

    Component {
        id: navigationExampleComponent

        NavigationBarExample {}
    }

    Component {
        id: dynamicCreationExampleComponent

        DynamicCreationExample {}
    }

    Component {
        id: rtlExampleComponent

        RtlSupportExample {}
    }

    Component {
        id: selectiveExampleComponent

        SelectiveLayoutExample {}
    }

    Component {
        id: controlsGalleryExampleComponent

        ControlsGalleryExample {}
    }

    Component {
        id: dualLayoutAntiExampleComponent

        DualLayoutExample {}
    }
}
