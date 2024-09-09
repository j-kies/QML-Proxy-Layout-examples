cmake_minimum_required(VERSION 3.16)

project(ProxyLayouts VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.6)

qt_add_executable(appProxyLayouts
    main.cpp
)

set(QML_FILES
    Main.qml
    controls/MenuPage.qml
    controls/PageHeader.qml
    controls/ExamplePage.qml
    controls/AdaptiveButton.qml
    controls/AdaptiveCard.qml
    examples/ButtonExample.qml
    examples/NavigationBarExample.qml
    examples/DualLayoutExample.qml
    examples/DynamicCreationExample.qml
    examples/RtlSupportExample.qml
    examples/SelectiveLayoutExample.qml
    examples/ControlsGalleryExample.qml
    examples/ButtonExampleWithoutProxy1.qml
    examples/ButtonExampleWithoutProxy2.qml
)

qt_add_qml_module(appProxyLayouts
    URI ProxyLayouts
    VERSION 1.0
    QML_FILES ${QML_FILES}
)

set(ASSETS
    assets/sky1.jpg
    assets/sky2.jpg
    assets/sky3.jpg
    assets/sky4.jpg
    assets/sky5.jpg
    assets/sky6.jpg
    assets/icons/cloud-bolt-svgrepo-com.svg
    assets/icons/cloud-rain-alt-1-svgrepo-com.svg
    assets/icons/cloud-rainbow-svgrepo-com.svg
    assets/icons/cloud-sun-alt-svgrepo-com.svg
    assets/icons/eclipse-svgrepo-com.svg
    assets/icons/snow-alt-1-svgrepo-com.svg
    assets/icons/sun-haze-svgrepo-com.svg
    assets/icons/temperature-arrow-up-svgrepo-com.svg
    assets/icons/umbrella-svgrepo-com.svg
    assets/icons/arrow-circle-right-svgrepo-com.svg
)

qt_add_resources(appProxyLayouts "images"
    PREFIX "/"
    FILES ${ASSETS}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appProxyLayouts PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appProxyLayouts
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appProxyLayouts
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appProxyLayouts
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
