//
//  ProductDetailsController.swift
//  FirstTask
//
//  Created by ahmed sherif on 15/12/2022.
//

import UIKit

class ProductDetailsController: UIViewController {
    
    //MARK: IBOutles
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLable: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    //MARK: Variables
    let passedArray: Products = 
    let productTitle: String = ""
    let productPrice: Int = 0
    let productDescription: String = ""
    let productBrand: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brandLabel.text = passedArray.brand
        titleLabel.text = passedArray.title
        descriptionLable.text = passedArray.description
        priceLabel.text = String(passedArray.price)
        
    }
}
