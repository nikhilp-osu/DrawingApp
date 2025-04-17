//
//  ToolPickerView.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI

struct ToolPickerView: View {
    @Binding var selectedTool: ToolType
    var body: some View {
        HStack(spacing: 12) {
            ForEach(ToolType.allCases) { tool in
                Image(systemName: tool.systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .foregroundStyle(selectedTool == tool ? Color.accentColor : Color.primary)
                    .onTapGesture { selectedTool = tool }
            }
        }
    }
}
