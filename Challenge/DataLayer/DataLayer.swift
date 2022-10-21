//  DataLayer.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

import Foundation

struct DataLayer: DataLayerProtocol {
    func getModel(filename: String) -> [ItemModel]? {
        guard let itemData = loadJSONData(filename: filename) else { return nil }
        return parse(jsonData: itemData)
    }
}

extension DataLayer {
    private func loadJSONData(filename: String) -> Data? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
    
    private func parse(jsonData: Data) -> [ItemModel]? {
        do {
            return try JSONDecoder().decode([ItemModel].self, from: jsonData)
        } catch {
            print(Errors.DECODE_ERROR)
        }
        return nil
    }
}

