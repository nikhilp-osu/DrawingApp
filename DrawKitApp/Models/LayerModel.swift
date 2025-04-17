//
//  LayerModel.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import PencilKit
import SwiftUI

struct LayerModel: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var drawing: PKDrawing = PKDrawing()
    var isVisible: Bool = true
}
