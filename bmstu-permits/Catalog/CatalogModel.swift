//
//  CatalogModel.swift
//  yourProjectName
//
//  Created by Olga on 01.01.2024.
//

import Foundation

final class CatalogModel {
    private let catalogNetworkManager = CatalogService.shared
    
    func loadCatalog(with title: String? = nil,
                     completion: @escaping (Result<[CatalogUIModel], Error>) -> Void) {

        catalogNetworkManager.getCatalogData(with: title) { result in
            switch result {
            case .success(let data):
                print("Data: ", data)
                let catalogUIModels = data.buildings.map { route in
                    return CatalogUIModel(id: route.id,
                                          name: route.name,
                                          image: route.image)
                }
                completion(.success(catalogUIModels))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
