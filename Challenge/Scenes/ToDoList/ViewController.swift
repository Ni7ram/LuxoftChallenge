//  ViewController.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewProtocol {
    
    // DEPENDENCIES
    private var presenter: PresenterProtocol
    
    // VARs
    private var items: [ItemViewModel] = []
    
    // IBs
    @IBOutlet weak var tasksTableView: UITableView!
    
    init?(coder: NSCoder, presenter: PresenterProtocol) {
        self.presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Initialize this class with init(coder:presenter:)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTable()
    }
    
    func showItems(_ items: [ItemViewModel]) {
        self.items = items
    }
    
    @objc private func refreshContent() {
        items.append(contentsOf: presenter.loadMoreItems())
        tasksTableView.refreshControl?.endRefreshing()
        tasksTableView.reloadData()
    }
}

extension ViewController {
    private func initializeTable() {
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
        // TODO: Set loader image
        tasksTableView.backgroundView = UIView()
        
        // Pull to refresh
        tasksTableView.refreshControl = UIRefreshControl()
        tasksTableView.refreshControl?.tintColor = .white
        tasksTableView.refreshControl?.addTarget(self, action: #selector(self.refreshContent), for: .valueChanged)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard items.count > 0 else { return 0 }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath) as! myTableViewCell
        cell.recycleCellWith(items[indexPath.row])
        return cell
    }
}
