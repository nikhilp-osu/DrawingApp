//
//  ExportSheet.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI
import UIKit

struct ExportSheet: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: [url], applicationActivities: nil)
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
}
