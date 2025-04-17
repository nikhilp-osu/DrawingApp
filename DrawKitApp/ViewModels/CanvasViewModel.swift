//
//  CanvasViewModel.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI
import PencilKit

class CanvasViewModel: ObservableObject {
    @Published var layers: [LayerModel] = [LayerModel(name: "Layer 1")]
    @Published var selectedLayerIndex = 0
    @Published var currentColor: Color = .black
    @Published var thickness: CGFloat = 5
    @Published var selectedTool: ToolType = .pencil
    @Published var showLayerManager = false
    @Published var showExportSheet = false
    @Published var exportURL: URL?

    func addLayer() {
        layers.append(LayerModel(name: "Layer \(layers.count + 1)"))
        selectedLayerIndex = layers.count - 1
    }

    func deleteLayer(at offsets: IndexSet) {
        layers.remove(atOffsets: offsets)
        selectedLayerIndex = min(selectedLayerIndex, layers.count - 1)
    }

    func toggleVisibility(for layer: LayerModel) {
        if let i = layers.firstIndex(of: layer) {
            layers[i].isVisible.toggle()
        }
    }

    func toolForCurrentSettings() -> PKTool {
        selectedTool.pkTool(color: UIColor(currentColor), width: thickness)
    }

    func prepareExport() {
        let drawing = CanvasService.mergedDrawing(from: layers)
        let image = CanvasService.image(from: drawing)
        guard let data = image.pngData() else { return }
        let dir = FileManager.default.temporaryDirectory
        let f = DateFormatter()
        f.dateFormat = "yyyyMMdd_HHmmss"
        let url = dir.appendingPathComponent("Drawing_\(f.string(from: Date())).png")
        try? data.write(to: url)
        exportURL = url
        showExportSheet = true
    }
}
