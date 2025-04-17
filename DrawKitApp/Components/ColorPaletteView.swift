//
//  ColorPaletteView.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI

struct ColorPaletteView: View {
    @EnvironmentObject private var vm: CanvasViewModel
    @Binding var selectedColor: Color
    private let colors: [Color] = [.black, .gray, .red, .orange, .yellow, .green, .blue, .purple]

    var body: some View {
        HStack(spacing: 8) {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .fill(color)
                    .frame(width: 24, height: 24)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: selectedColor == color ? 2 : 0)
                    )
                    .onTapGesture {
                        selectedColor = color
                        if vm.selectedTool == .eraser { vm.selectedTool = .pencil }
                    }
            }
        }
    }
}
