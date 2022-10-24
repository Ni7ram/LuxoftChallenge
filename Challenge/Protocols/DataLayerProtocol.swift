//  DataLayerProtocol.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

protocol DataLayerProtocol {
    func getModels(filename: String) -> [ItemModel]?
}
