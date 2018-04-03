//
//  PortalService.swift
//  CollectionViewRestAPI
//
//  Created by Rohith Raju on 02/04/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import UIKit

protocol PortalServiceDelegate: class {
    
    func sendBlogData(data:[Article])
    func errorBlogData(str:String)
}

class PortalService: NSObject {
   
    
  let baseUrl = "https://swift.mrgott.pro/blog.json"
  weak var delegate:PortalServiceDelegate?
    
    
    func getBlogData(){
        guard let url = URL(string:baseUrl) else {
            return 
        }
        
        URLSession.shared.dataTask(with: url){(data,response,error) in
            if error != nil {
               print(error!.localizedDescription)
            }
            
            guard let data = data else{ return }
            do{
                let jsonDecoded = try JSONDecoder().decode([Article].self, from: data)
                print("json:\(jsonDecoded)")
                self.delegate?.sendBlogData(data:jsonDecoded)
                
            }catch let jsonError {
                self.delegate?.errorBlogData(str:jsonError.localizedDescription)
                print(jsonError)
                
            }
        }.resume()
        
    }
    

    
    
}
