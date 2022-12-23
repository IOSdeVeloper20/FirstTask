//
//  JsonParsing.swift
//  FirstTask
//
//  Created by ahmed sherif on 15/12/2022.
//

import Foundation

struct JsonData: Codable {
    let products:[Products]
}


struct Products: Codable {
    let id:Int
    let title: String
    let description:String
    let price: Double
    let brand:String
    let thumbnail:String
    let images:[String]
}



