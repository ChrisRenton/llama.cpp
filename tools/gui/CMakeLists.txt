cmake_minimum_required(VERSION 3.16)

project(llama-gui LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 6.4 COMPONENTS Quick QuickControls2 REQUIRED)

add_executable(llama-gui
    src/main.cpp
    qml/qml.qrc
)

target_link_libraries(llama-gui PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    llama
)

target_compile_features(llama-gui PRIVATE cxx_std_17)

if (WIN32)
    target_compile_definitions(llama-gui PRIVATE NOMINMAX)
endif()

set_target_properties(llama-gui PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

