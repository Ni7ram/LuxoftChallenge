//
//  ViewController.swift
//  Challenge
//
//  Created by Martin Cardozo on 19/10/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var jsonTableView: UITableView!
    
    // DEPENDENCIES
    private var dataLayer: DataLayerProtocol?
    private var presenter: PresenterProtocol?
    
    // VARS
    private var itemModels: [ItemModel]?
    private let cellHeight: CGFloat = 140
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        getData()
    }
    
    private func initialize() {
        dataLayer = DataLayer()
        presenter = Presenter()
        jsonTableView.dataSource = self
        jsonTableView.delegate = self
    }
    
    private func getData() {
        itemModels = dataLayer?.getModel(filename: "Item")
        jsonTableView.reloadData()
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard itemModels!.count > 0 else { return 0 }
        return itemModels!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath) as! myTableViewCell
        let viewModel = presenter!.mapDTOtoViewModel((itemModels?[indexPath.row])!)
        cell.fillWithContent(viewModel)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeight
    }
}


