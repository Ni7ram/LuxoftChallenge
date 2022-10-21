//  PresenterProtocol.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

protocol PresenterProtocol {
    func mapDTOtoViewModel(_ model: ItemModel) -> ItemViewModel
}
