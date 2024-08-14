//
//  Cat.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-11.
//

import Foundation
import SwiftyJSON

struct Cat: Identifiable, Equatable {
    let id: String
    let url: String
    let width: Int
    let height: Int
    let breeds: [Breed]?

    init(json: JSON) {
        self.id = json["id"].stringValue
        self.url = json["url"].stringValue
        self.width = json["width"].intValue
        self.height = json["height"].intValue
        self.breeds = json["breeds"].arrayValue.compactMap { Breed(json: $0) }
    }
    
    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return lhs.id == rhs.id &&
               lhs.url == rhs.url &&
               lhs.width == rhs.width &&
               lhs.height == rhs.height
    }
}
