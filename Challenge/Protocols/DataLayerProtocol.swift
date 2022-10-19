//
//  DataLayerProtocol.swift
//  Challenge
//
//  Created by Martin Cardozo on 19/10/2022.
//

import Foundation

protocol DataLayerProtocol {
    func getModel(filename: String) -> [ItemModel]?
}
