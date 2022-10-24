//  ViewController.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // DEPENDENCIES
    private var dataLayer: DataLayerProtocol?
    private var presenter: PresenterProtocol?
    
    // VARs
    private var itemModels: [ItemModel]?
    
    // IBs
    @IBOutlet weak var tasksTableView: UITableView!
    
    convenience init?(coder: NSCoder, dataLayer: DataLayerProtocol, presenter: PresenterProtocol) {
        self.init(coder: coder)
        self.dataLayer = dataLayer
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        initializeTable()
    }
    
    private func getData() {
        itemModels = dataLayer?.getModels(filename: "Item") ?? []
    }
}

extension ViewController {
    private func initializeTable() {
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        tasksTableView.reloadData()
    }
    
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
