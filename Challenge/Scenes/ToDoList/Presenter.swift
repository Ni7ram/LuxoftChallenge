//  Presenter.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

class Presenter: PresenterProtocol {
    
    // DEPENDENCIES
    private var repository: DataLayerProtocol?
    var view: ViewProtocol?
    
    init(repository: DataLayerProtocol) {
        self.repository = repository
    }
    
    func setView(_ view: ViewProtocol) {
        self.view = view
        let viewModels = getViewModels()
        view.addItemsToShow(viewModels)
    }
}

extension Presenter {
    private func getViewModels() -> [ItemViewModel] {
        // 1. Get models
        guard let itemModels = repository?.getModels() else { return [] }
        
        // 2. Map to ViewModels
        var viewModels: [ItemViewModel] = []
        for model in itemModels {
            viewModels.append(mapDTOtoViewModel(model))
        }
        
        return viewModels
    }
    
    private func mapDTOtoViewModel(_ model: ItemModel) -> ItemViewModel {
        ItemViewModel(title: model.title ?? "", description: model.details?.description ?? "", day: DateHelper().getDayName(model.details?.day ?? 0))
    }
}
