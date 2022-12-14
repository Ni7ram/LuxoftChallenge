//  myTableViewCell.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

import UIKit

class myTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    func recycleCellWith(_ content: ItemViewModel) {
        titleLabel.text = content.title
        descriptionLabel.text = content.description
        dayLabel.text = content.day
    }
}
