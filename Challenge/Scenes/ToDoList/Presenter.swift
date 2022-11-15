//  Presenter.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

class Presenter: PresenterProtocol {
    
    // DEPENDENCIES
    private var repository: DataLayerProtocol
    var view: ViewProtocol? {
        didSet {
            displayData()
        }
    }
    
    init(repository: DataLayerProtocol) {
        self.repository = repository
    }
    
    func loadMoreItems() -> [ItemViewModel] {
        return getViewModels()
    }
}

extension Presenter {
    private func displayData() {
        let viewModels = getViewModels()
        view?.showItems(viewModels)
    }
    
    private func getViewModels() -> [ItemViewModel] {
        // 1. Get models
        guard let itemModels = repository.getModels() else { print(Errors.SERVICE_ERROR); return [] }
        
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
