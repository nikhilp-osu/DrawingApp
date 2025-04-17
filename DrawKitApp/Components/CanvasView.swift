//
//  CanvasView.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @EnvironmentObject var viewModel: CanvasViewModel

    func makeUIView(context: Context) -> PKCanvasView {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput
        canvas.tool = viewModel.toolForCurrentSettings()
        canvas.backgroundColor = .systemBackground
        canvas.delegate = context.coordinator
        return canvas
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = viewModel.toolForCurrentSettings()
        let currentDrawing = viewModel.layers[viewModel.selectedLayerIndex].drawing
        if uiView.drawing != currentDrawing {
            uiView.drawing = currentDrawing
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    class Coordinator: NSObject, PKCanvasViewDelegate {
        var parent: CanvasView
        init(_ parent: CanvasView) { self.parent = parent }
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            let drawing = canvasView.drawing
            let index = parent.viewModel.selectedLayerIndex
            DispatchQueue.main.async {
                self.parent.viewModel.layers[index].drawing = drawing
            }
        }
    }
}

