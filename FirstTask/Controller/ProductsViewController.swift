//
//  ViewController.swift
//  FirstTask
//
//  Created by ahmed sherif on 12/12/2022.
//

import UIKit

class ProductsViewController: UIViewController {
    // MARK: - Variables
    var products: ProductModel?
    
    // MARK: - IBOUtlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    // MARK: - IBAction
    
    //MARK: TableView Configuration
    
    func fetchData() {
        //MARK: Parsing json
        let urlString = "https://dummyjson.com/products"
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        //2. create url session
        let session = URLSession(configuration: .default)
        //3. give urlSession a task
        let task = session.dataTask(with: url!) { [weak self] (data, response, error) in
            guard let self = self else { return }
            //check for errors
            if(error == nil && data != nil){
                //parse json
                let decoder = JSONDecoder()
                do {
                    let info = try decoder.decode(ProductModel.self, from: data!)
                    self.products = info
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        //4. start the task
        task.resume()
    }
    func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   true
    }

    func tableViewConfig() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellReuseIdentifier: TableViewCell.cellIdentifier)
    }
    
}

extension ProductsViewController:  UITableViewDelegate, UITableViewDataSource {
    //method determines how many rows there will be in the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.products.count ?? 0
    }
    
    // method sets up each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath) as! TableViewCell
        let product = products?.products[indexPath.row]
        cell.set(product?.title ?? "Not founded")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products?.products[indexPath.row]
        let vc = ProductDetailsVC()
        vc.product = product
        navigationController?.pushViewController(vc, animated: false)
    }
}
