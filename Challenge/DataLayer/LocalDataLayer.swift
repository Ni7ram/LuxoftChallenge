//  DataLayer.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

import Foundation

struct LocalDataLayer: DataLayerProtocol {
    private let LOCAL_PATH = "Item"
    
    func getModels() -> [ItemModel]? {
        guard let models = parseJSON(filename: LOCAL_PATH) else { return nil }
        return models
    }
}

fileprivate extension LocalDataLayer {
    private func parseJSON(filename: String) -> [ItemModel]? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try? Data(contentsOf: url)
        guard let itemModels = decode(jsonData: data!) else { return [] }
        return itemModels
    }
    
    private func decode(jsonData: Data) -> [ItemModel]? {
        do {
            return try JSONDecoder().decode([ItemModel].self, from: jsonData)
        } catch {
            print(Errors.DECODE_ERROR)
        }
        return nil
    }
}

struct MockLocalDataLayer: DataLayerProtocol {
    func getModels() -> [ItemModel]? {
        return nil
    }
}

