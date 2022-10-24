//  PresenterProtocol.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

protocol PresenterProtocol {
    mutating func setView(_ view: ViewProtocol)
    func getViewModels() -> [ItemViewModel]
}
