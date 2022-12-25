//
//  TableViewCell.swift
//  FirstTask
//
//  Created by ahmed sherif on 23/12/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let cellIdentifier = "reusableCell"
    @IBOutlet weak var cellLabel: UILabel!
        
    func set(_ title: String) {
        cellLabel?.text = title 
    }
}
