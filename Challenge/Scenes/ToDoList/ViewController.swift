//  ViewController.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewProtocol {
    
    private var presenter: PresenterProtocol
    private var items = [ItemViewModel]()
    private let tableViewCellID = "myTableCell"
    @IBOutlet weak var tasksTableView: UITableView!
    
    
    // MARK: - Inits
    required init?(coder: NSCoder) {
        fatalError("Initialize this class with init(coder:presenter:)")
    }

    init?(coder: NSCoder, presenter: PresenterProtocol) {
        self.presenter = presenter
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTable()
    }
    
    // MARK: - Controller
    func showItems(_ items: [ItemViewModel]) {
        self.items = items
    }
    
    @objc private func pullToRefresh() {
        let newItems = presenter.fetchItems()
        items.append(contentsOf: newItems)
        tasksTableView.refreshControl?.endRefreshing()
        tasksTableView.reloadData()
    }
}

// MARK: - TableView
extension ViewController {
    private func initializeTable() {
        // Data binding
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        
        // Pull to refresh
        tasksTableView.refreshControl = UIRefreshControl()
        tasksTableView.refreshControl?.tintColor = .white
        tasksTableView.refreshControl?.addTarget(self, action: #selector(self.pullToRefresh), for: .valueChanged)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard items.count > 0 else { return 0 }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID, for: indexPath) as! myTableViewCell
        cell.recycleCellWith(items[indexPath.row])
        return cell
    }
}
