//
//  ThicknessSliderView.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI

struct ThicknessSliderView: View {
    @Binding var thickness: CGFloat
    var body: some View {
        Slider(value: Binding(
            get: { Double(thickness) },
            set: { thickness = CGFloat($0) }),
               in: 1...30)
        .frame(width: 90)
    }
}
