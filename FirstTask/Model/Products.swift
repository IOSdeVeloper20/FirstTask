//
//  JsonParsing.swift
//  FirstTask
//
//  Created by ahmed sherif on 15/12/2022.
//

import Foundation

struct JsonData: Codable {
    var products:[Products]?
}


struct Products: Codable {
    var id:Int?
    var title: String?
    var description:String?
    var price: Double?
    var brand:String?
    var thumbnail:String?
    let images:[String]
}



