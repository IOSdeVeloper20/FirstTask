//
//  ParseJson.swift
//  FirstTask
//
//  Created by ahmed sherif on 20/12/2022.
//

import Foundation
struct ParseJson {
    func pars(){
        //1. create url
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
                    
                    print(info)
                    
                } catch {
                    print("ERROR parsing JSON")
                }
            }
        }
        //4. start the task
        task.resume()
    }
}

