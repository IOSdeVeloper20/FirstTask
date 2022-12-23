//
//  ViewController.swift
//  FirstTask
//
//  Created by ahmed sherif on 12/12/2022.
//

import UIKit

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var object: [Products] = []
    
    //let pr = ["ahmed", "sherif"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewConfig()
        
        //MARK: Parsing json
        let urlString = "https://dummyjson.com/products"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        //2. create url session
        let session = URLSession(configuration: .default)
        
        //3. give urlSession a task
        let task = session.dataTask(with: url!) { (data, response, error) in
            //check for errors
            if(error == nil && data != nil){
                //parse json
                let decoder = JSONDecoder()
                
                do {
                    let info = try decoder.decode(JsonData.self, from: data!)
                    
                    
                    let title = info.products[1].title
                    print(title)
                    print(info)
                } catch {
                    print("ERROR parsing JSON")
                }
            }
        }
        //4. start the task
        task.resume()
    }

    //MARK: TableView Configuration
    func tableViewConfig() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
}




extension ProductsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    //method determines how many rows there will be in the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    //    //method sets up each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! TableViewCell
        let productName = object[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let productModel = object[indexPath.row]
            let vc = ProductDetailsController()
            vc.passedArray = productModel
            navigationController?.pushViewController(vc, animated: false)
        }
}
