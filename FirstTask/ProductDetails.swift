//
//  ProductDetailsVC.swift
//  FirstTask
//
//  Created by Abdalazem Saleh on 2022-12-25.
//

import UIKit

class ProductDetailsVC: UIViewController {
    // MARK: - Variables
    var product: ProductData?
    // MARK: - IBOUtlet
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = product?.title
        view.backgroundColor = .systemBackground
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    // MARK: - Functions
    func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   false
    }

    private func setData() {
//        brandTitle.text = product?.brand
//        brandName.text  = product?.title
    }
}
