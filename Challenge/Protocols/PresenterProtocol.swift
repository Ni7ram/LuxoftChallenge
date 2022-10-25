//  PresenterProtocol.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

// TODO: Find out if makes sense to declare a protocol as 'internal' (if it does makes sense, then it is neccesary)
protocol PresenterProtocol {
    var view: ViewProtocol? { get set }
}
