//
//  ProductDetailsController.swift
//  FirstTask
//
//  Created by ahmed sherif on 15/12/2022.
//

import UIKit

class ProductDetailsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
