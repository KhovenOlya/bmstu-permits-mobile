//
//  DetailInformatioModel.swift
//  metroStreams
//
//  Created by Olga on 01.01.2024.
//

import Foundation

final class DetailInformatioModel {
    private let catalogNetworkManager = CatalogService.shared
    
    func loadDetailInformation(with id: Int, completion: @escaping (Result<DetailInformationApiModel, Error>) -> Void) {
        catalogNetworkManager.getCatalogDelailData(with: id) { result in
            completion(result)
        }
    }
}
