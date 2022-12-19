//
//  ViewController.swift
//  FirstTask
//
//  Created by ahmed sherif on 12/12/2022.
//

import UIKit

class ProductsViewController: UITableViewController {
    
    let p = ParseJson()
    let j = JsonData()
    
    let products = ["iphone x", "iphone 11"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        p.pars()
    }
    
    
    
    
    //MARK: tableView DataSource Methods
    
    
    //method determines how many rows there will be in the table view.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    
    //method sets up each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell =
        tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
        Cell.textLabel?.text = products[indexPath.row]
        
        return Cell
    }
    
    
    
    
    //MARK: tableView Delegate Methods

    
    //The didSelectRowAtIndexPath method is called every time a row is tapped.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(products[indexPath.row])
        
        
        // to make a cell flash gray when selected
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


