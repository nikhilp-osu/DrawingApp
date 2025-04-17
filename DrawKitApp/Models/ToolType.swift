//
//  ToolType.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import PencilKit
import SwiftUI

enum ToolType: String, CaseIterable, Identifiable {
    case pencil
    case pen
    case marker
    case eraser

    var id: String { rawValue }

    var systemImage: String {
        switch self {
        case .pencil: return "pencil"
        case .pen: return "pencil.line"
        case .marker: return "highlighter"
        case .eraser: return "eraser"
        }
    }

    func pkTool(color: UIColor, width: CGFloat) -> PKTool {
        switch self {
        case .pencil:
            return PKInkingTool(.pencil, color: color, width: width)
        case .pen:
            return PKInkingTool(.pen, color: color, width: width)
        case .marker:
            return PKInkingTool(.marker, color: color, width: width)
        case .eraser:
            return PKEraserTool(.vector)
        }
    }
}
