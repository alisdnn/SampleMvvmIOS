//
//  Cat.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-11.
//

import SwiftyJSON


struct Cat: Identifiable, Equatable {
    let id: String
    let url: String
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.url = json["url"].stringValue
    }
    
    // Conform to Equatable by implementing the == operator
    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return lhs.id == rhs.id && lhs.url == rhs.url
    }
}
