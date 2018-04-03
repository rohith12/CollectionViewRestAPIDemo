//
//  Article.swift
//  CollectionViewRestAPI
//
//  Created by Rohith Raju on 02/04/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import Foundation

struct Article: Codable {
    let title: String
    let description : String
   
    private enum CodingKeys: String, CodingKey {
        case title, description
    }
}



