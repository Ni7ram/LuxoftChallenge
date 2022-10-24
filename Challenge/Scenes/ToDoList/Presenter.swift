//  Presenter.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

class Presenter: PresenterProtocol {
    
    // DEPENDENCIES
    private var repository: DataLayerProtocol?
    
    // VARS
    var view: ViewProtocol?
    
    init(repository: DataLayerProtocol) {
        self.repository = repository
    }
    
    func setView(_ view: ViewProtocol) {
        self.view = view
    }
    
    func getViewModels() -> [ItemViewModel] {
        guard let itemModels = repository?.getModels(filename: "Item") else { return [] }
        
        var viewModels: [ItemViewModel] = []
        
        for model in itemModels {
            viewModels.append(mapDTOtoViewModel(model))
        }
        
        return viewModels
    }
    
    func mapDTOtoViewModel(_ model: ItemModel) -> ItemViewModel {
        ItemViewModel(title: model.title ?? "", description: model.details?.description ?? "", day: DateHelper().getDayName(model.details?.day ?? 0))
    }
}
