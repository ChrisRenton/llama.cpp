import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: win
    width: 1100
    height: 700
    visible: true
    title: "llama.cpp MoE GUI"

    // Dark palette with subtle purple accents
    palette {
        window: "#111217"
        windowText: "#EDEDF0"
        base: "#151722"
        text: "#EDEDF0"
        button: "#1E2030"
        buttonText: "#EDEDF0"
        highlight: "#7B5CD6" // muted purple
        highlightedText: "#FFFFFF"
    }

    header: ToolBar {
        contentHeight: 40
        RowLayout {
            anchors.fill: parent
            spacing: 12

            Label { text: "Model:"; color: "#C9C9D3"; Layout.margins: 8 }
            TextField { id: modelPath; text: "C:/models/..."; Layout.fillWidth: true }
            Button { text: "Start Server"; onClicked: console.log("TODO: start server") }
            Button { text: "Load Log"; onClicked: fileDialog.open() }
        }
    }

    FileDialog {
        id: fileDialog
        title: "Open moe-log.jsonl"
        nameFilters: ["JSONL files (*.jsonl)", "All files (*)"]
        onAccepted: console.log("Selected: ", selectedFile)
    }

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        // Left: Controls
        Frame {
            SplitView.preferredWidth: 320
            background: Rectangle { color: "#12131A"; radius: 6 }
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 10

                Label { text: "MoE Controls"; font.bold: true; color: "#C9C9D3" }
                ComboBox { id: metricSel; model: ["selection_count", "weight_sum"]; currentIndex: 0 }
                RowLayout {
                    Label { text: "Top-K"; color: "#A7A7B4" }
                    SpinBox { id: topk; from: 1; to: 160; value: 20 }
                }
                Button { text: "Refresh"; onClicked: console.log("TODO: refresh charts") }
                Button { text: "Apply Skip"; onClicked: console.log("TODO: post skip & reload") }
                Item { Layout.fillHeight: true }
            }
        }

        // Right: Charts placeholder
        Frame {
            background: Rectangle { color: "#0E0F14"; radius: 6 }
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 12

                Label { text: "Top Experts (placeholder)"; color: "#C9C9D3"; font.pixelSize: 18 }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    radius: 8
                    color: "#151722"
                    border.color: "#2A2C3B"
                    Text { anchors.centerIn: parent; text: "Chart coming soon"; color: "#7B5CD6" }
                }
            }
        }
    }
}

