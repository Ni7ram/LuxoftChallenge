//
//  ItemModel.swift
//  Challenge
//
//  Created by Martin Cardozo on 19/10/2022.
//

import Foundation

struct ItemModel: Codable {
    let title: String?
    let details: Description?
}

struct Description: Codable {
    let description: String?
    let day: Int?
}
