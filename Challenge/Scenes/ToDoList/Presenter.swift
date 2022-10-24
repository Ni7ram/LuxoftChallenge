//  Presenter.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

struct Presenter: PresenterProtocol {
    
//    // DEPENDENCIES
//    private var repository: DataLayerProtocol?
//    
//    // VARS
//    private var itemModels: [ItemModel]
//    var view: ViewProtocol
//    
//    init(repository: DataLayerProtocol) {
//        self.repository = repository
//    }
//    
//    func getModels() -> [ItemModel]? {
//        
//    }
    
    func mapDTOtoViewModel(_ model: ItemModel) -> ItemViewModel {
        ItemViewModel(title: model.title ?? "", description: model.details?.description ?? "", day: DateHelper().getDayName(model.details?.day ?? 0))
    }
}
