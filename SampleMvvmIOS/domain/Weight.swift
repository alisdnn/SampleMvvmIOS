//
//  Weight.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-13.
//

import Foundation
import SwiftyJSON

struct Weight: Identifiable, Equatable {
    let id = UUID()  // Since Weight doesn't have an id in the JSON, we can use a UUID
    let imperial: String
    let metric: String

    init(json: JSON) {
        self.imperial = json["imperial"].stringValue
        self.metric = json["metric"].stringValue
    }
}
