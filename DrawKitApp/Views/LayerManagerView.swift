//
//  LayerManagerView.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI

struct LayerManagerView: View {
    @EnvironmentObject var viewModel: CanvasViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(viewModel.layers.enumerated()), id: \.element.id) { index, layer in
                    LayerRowView(layer: layer,
                                 isSelected: index == viewModel.selectedLayerIndex) {
                        viewModel.toggleVisibility(for: layer)
                    }
                    .onTapGesture { viewModel.selectedLayerIndex = index }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            viewModel.deleteLayer(at: IndexSet(integer: index))
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteLayer)
            }
            .navigationTitle("Layers")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { viewModel.addLayer() } label: { Image(systemName: "plus") }
                }
            }
        }
        .presentationDetents([.medium])
    }
}
