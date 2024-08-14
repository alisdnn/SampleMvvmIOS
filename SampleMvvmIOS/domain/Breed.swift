//
//  Breed.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-13.
//

import Foundation
import SwiftyJSON

struct Breed: Identifiable, Equatable {
    let id: String
    let name: String
    let vetstreet_url: String?
    let temperament: String?
    let origin: String?
    let country_codes: String?
    let country_code: String?
    let description: String?
    let life_span: String?
    let indoor: Int?
    let lap: Int?
    let alt_names: String?
    let adaptability: Int?
    let affection_level: Int?
    let child_friendly: Int?
    let dog_friendly: Int?
    let energy_level: Int?
    let grooming: Int?
    let health_issues: Int?
    let intelligence: Int?
    let shedding_level: Int?
    let social_needs: Int?
    let stranger_friendly: Int?
    let vocalisation: Int?
    let experimental: Int?
    let hairless: Int?
    let natural: Int?
    let rare: Int?
    let rex: Int?
    let suppressed_tail: Int?
    let short_legs: Int?
    let wikipedia_url: String?
    let hypoallergenic: Int?
    let reference_image_id: String?
    let weight: Weight?

    init(json: JSON) {
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.vetstreet_url = json["vetstreet_url"].string
        self.temperament = json["temperament"].string
        self.origin = json["origin"].string
        self.country_codes = json["country_codes"].string
        self.country_code = json["country_code"].string
        self.description = json["description"].string
        self.life_span = json["life_span"].string
        self.indoor = json["indoor"].int
        self.lap = json["lap"].int
        self.alt_names = json["alt_names"].string
        self.adaptability = json["adaptability"].int
        self.affection_level = json["affection_level"].int
        self.child_friendly = json["child_friendly"].int
        self.dog_friendly = json["dog_friendly"].int
        self.energy_level = json["energy_level"].int
        self.grooming = json["grooming"].int
        self.health_issues = json["health_issues"].int
        self.intelligence = json["intelligence"].int
        self.shedding_level = json["shedding_level"].int
        self.social_needs = json["social_needs"].int
        self.stranger_friendly = json["stranger_friendly"].int
        self.vocalisation = json["vocalisation"].int
        self.experimental = json["experimental"].int
        self.hairless = json["hairless"].int
        self.natural = json["natural"].int
        self.rare = json["rare"].int
        self.rex = json["rex"].int
        self.suppressed_tail = json["suppressed_tail"].int
        self.short_legs = json["short_legs"].int
        self.wikipedia_url = json["wikipedia_url"].string
        self.hypoallergenic = json["hypoallergenic"].int
        self.reference_image_id = json["reference_image_id"].string
        self.weight = Weight(json: json["weight"])
    }
}
