//
//  CatalogApiModel.swift
//  yourProjectName
//
//  Created by Olga on 01.01.2024.
//

import Foundation

struct Building: Codable {
    let id: Int
    let name: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image"
    }
}

struct CatalogApiModel: Codable {
    let buildings: [Building]
    enum CodingKeys: String, CodingKey {
        case buildings = "buildings"
    }
}
