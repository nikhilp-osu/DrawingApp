//
//  CanvasService.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import PencilKit
import UIKit

struct CanvasService {
    static func mergedDrawing(from layers: [LayerModel]) -> PKDrawing {
        var result = PKDrawing()
        for layer in layers where layer.isVisible {
            result.strokes.append(contentsOf: layer.drawing.strokes)
        }
        return result
    }

    static func image(from drawing: PKDrawing, scale: CGFloat = UIScreen.main.scale) -> UIImage {
        let bounds = drawing.bounds
        return drawing.image(from: bounds, scale: scale)
    }
}
