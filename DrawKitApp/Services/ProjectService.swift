//
//  ProjectService.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import Foundation
import PencilKit

struct ProjectFile: Codable {
    struct LayerFile: Codable {
        var name: String
        var isVisible: Bool
        var drawingData: Data
    }
    var layers: [LayerFile]
}

enum ProjectService {
    private static let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "yyyyMMdd_HHmmss_SSS"
        return f
    }()

    static func save(_ layers: [LayerModel], to directory: URL? = nil) throws -> URL {
        let dir = directory ?? FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let stamp = formatter.string(from: Date())
        var url = dir.appendingPathComponent("Drawing_\(stamp).drawkit")
        var n = 1
        while FileManager.default.fileExists(atPath: url.path) {
            url = dir.appendingPathComponent("Drawing_\(stamp)_\(n).drawkit")
            n += 1
        }
        let file = ProjectFile(layers: layers.map {
            .init(name: $0.name, isVisible: $0.isVisible, drawingData: $0.drawing.dataRepresentation())
        })
        try JSONEncoder().encode(file).write(to: url)
        return url
    }

    static func load(from url: URL) throws -> [LayerModel] {
        let data = try Data(contentsOf: url)
        let file = try JSONDecoder().decode(ProjectFile.self, from: data)
        return try file.layers.map {
            LayerModel(name: $0.name, drawing: try PKDrawing(data: $0.drawingData), isVisible: $0.isVisible)
        }
    }
}
