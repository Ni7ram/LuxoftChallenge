//  ViewController.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewProtocol {
    
    // DEPENDENCIES
    private let presenter: PresenterProtocol
    
    // VARs
    private var items: [ItemViewModel] = []
    
    // IBs
    @IBOutlet weak var tasksTableView: UITableView!
    
    convenience init?(coder: NSCoder, presenter: PresenterProtocol) {
        self.presenter = presenter
    }
    
//    convenience init?(coder: NSCoder) {
//        self.init(coder: coder)
//        self.presenter = presenter
//        self.presenter?.setView(self)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTable()
        getData()
    }
    
    private func getData() {
        items = presenter.getViewModels()
    }
    
    func addElements() {
        tasksTableView.reloadData()
    }
}

extension ViewController {
    private func initializeTable() {
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard items.count > 0 else { return 0 }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath) as! myTableViewCell
        cell.fillWithContent(items[indexPath.row])
        return cell
    }
}
