//
//  ExportService.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI
import UIKit

struct ExportService {
    static func activityView(for image: UIImage) -> UIActivityViewController {
        UIActivityViewController(activityItems: [image], applicationActivities: nil)
    }
}
