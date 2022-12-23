//
//  TableViewCell.swift
//  FirstTask
//
//  Created by ahmed sherif on 23/12/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
        
    func set(_ title: String) {
        cellLabel.text = title
    }
}
