//
//  ContentView.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: CanvasViewModel
    var body: some View {
        ZStack {
            CanvasView()
                .ignoresSafeArea()
            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ToolPickerView(selectedTool: $viewModel.selectedTool)
                        ColorPaletteView(selectedColor: $viewModel.currentColor)
                        ThicknessSliderView(thickness: $viewModel.thickness)
                        Button { viewModel.showLayerManager = true } label: { Image(systemName: "square.stack") }
                        Button { viewModel.prepareExport() } label: { Image(systemName: "square.and.arrow.up") }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                }
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.bottom, 12)
            }
        }
        .sheet(isPresented: $viewModel.showLayerManager) { LayerManagerView() }
        .sheet(isPresented: $viewModel.showExportSheet) {
            if let url = viewModel.exportURL { ExportSheet(url: url) }
        }
    }
}
