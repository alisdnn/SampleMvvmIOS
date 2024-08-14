//
//  CatGridItemView.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-11.
//

import SwiftUI
import Kingfisher
import SwiftyJSON

struct CatDetailView: View {
    let cat: Cat
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Cat Image
                KFImage(URL(string: cat.url))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                // Cat Dimensions
                Text("Dimensions: \(cat.width) x \(cat.height)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // Breeds Information
                if let breeds = cat.breeds, !breeds.isEmpty {
                    ForEach(breeds, id: \.id) { breed in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Breed: \(breed.name)")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            if let description = breed.description {
                                Text(description)
                                    .font(.body)
                            }
                            
                            if let temperament = breed.temperament {
                                Text("Temperament: \(temperament)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            if let origin = breed.origin {
                                Text("Origin: \(origin)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            if let lifeSpan = breed.life_span {
                                Text("Life Span: \(lifeSpan) years")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            // Additional Breed Info
                            VStack(alignment: .leading, spacing: 4) {
                                if let weight = breed.weight {
                                    Text("Weight: \(weight.metric) kg (\(weight.imperial) lbs)")
                                }
                                if let adaptability = breed.adaptability {
                                    Text("Adaptability: \(adaptability)")
                                }
                                if let affectionLevel = breed.affection_level {
                                    Text("Affection Level: \(affectionLevel)")
                                }
                                if let childFriendly = breed.child_friendly {
                                    Text("Child Friendly: \(childFriendly)")
                                }
                                if let dogFriendly = breed.dog_friendly {
                                    Text("Dog Friendly: \(dogFriendly)")
                                }
                                if let energyLevel = breed.energy_level {
                                    Text("Energy Level: \(energyLevel)")
                                }
                                if let intelligence = breed.intelligence {
                                    Text("Intelligence: \(intelligence)")
                                }
                                if let grooming = breed.grooming {
                                    Text("Grooming Needs: \(grooming)")
                                }
                                if let healthIssues = breed.health_issues {
                                    Text("Health Issues: \(healthIssues)")
                                }
                                if let socialNeeds = breed.social_needs {
                                    Text("Social Needs: \(socialNeeds)")
                                }
                                if let vocalisation = breed.vocalisation {
                                    Text("Vocalisation: \(vocalisation)")
                                }
                            }
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        }
                        .padding(.top)
                    }
                } else {
                    Text("No breed information available")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
        }
        .navigationBarTitle("Cat Details", displayMode: .inline)
    }
}


#Preview {
    CatDetailView(cat: Cat(json: JSON([ "height": 720,
                                        "id" : "r5FkDFDre",
                       "url" : "https://cdn2.thecatapi.com/images/r5FkDFDre.jpg",
                       "width" : 1280])))
}
