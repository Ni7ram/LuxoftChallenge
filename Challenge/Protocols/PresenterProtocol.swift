//  PresenterProtocol.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

protocol PresenterProtocol {
    var view: ViewProtocol? { get set }
    func fetchItems() -> [ItemViewModel]
}
