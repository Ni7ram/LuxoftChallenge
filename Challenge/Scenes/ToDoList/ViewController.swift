//  ViewController.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // DEPENDENCIES
    var dataLayer: DataLayerProtocol?
    var presenter: PresenterProtocol?
    
    // VARs
    private var itemModels: [ItemModel]?
    
    // IBs
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        initializeTable()
    }
    
    private func getData() {
        itemModels = dataLayer?.getModel(filename: "Item") ?? []
    }
    
    private func initializeTable() {
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        tasksTableView.reloadData()
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let models = itemModels, models.count > 0 else { return 0 }
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath) as! myTableViewCell
        let viewModel = presenter!.mapDTOtoViewModel((itemModels?[indexPath.row])!)
        cell.fillWithContent(viewModel)
        return cell
    }
}
