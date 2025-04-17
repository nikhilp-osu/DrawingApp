//
//  LayerRowView.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI

struct LayerRowView: View {
    var layer: LayerModel
    var isSelected: Bool
    var toggleVisibility: () -> Void
    var body: some View {
        HStack {
            Image(systemName: layer.isVisible ? "eye" : "eye.slash")
                .onTapGesture { toggleVisibility() }
            Text(layer.name)
                .fontWeight(isSelected ? .bold : .regular)
            Spacer()
        }
        .contentShape(Rectangle())
    }
}
