//
//  DetailInformationApiModel.swift
//  metroStreams
//
//  Created by Olga on 01.01.2024.
//

import Foundation

struct DetailInformationApiModel: Codable {
    let id: Int
    let name: String
    let location: String
    let open_hours: String
    let close_hours: String
    let image: String
}
