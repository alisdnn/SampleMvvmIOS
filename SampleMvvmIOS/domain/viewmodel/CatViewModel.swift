//
//  CatViewModel.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-11.
//

import SwiftUI
import Combine
import Alamofire
import SwiftyJSON

class CatViewModel: ObservableObject {
    @Published var cats: [Cat] = []
     var currentPage = 0
    private let limit = 10
    private let apiKey = "24be637f-e596-4847-b47a-1791feeea1bd"
    
    func fetchCats(page: Int, limit: Int = 10) {
        let url = "https://api.thecatapi.com/v1/images/search?limit=\(limit)&page=\(page)&order=Desc&api_key=\(apiKey)"
        
        
        
        
        // Create an instance of your logger
        let logger = NetworkLogger()

        // Create a session configuration (optional)
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // Example: set request timeout interval

        // Create an Alamofire Session with the logger
        let session = Session(configuration: configuration, eventMonitors: [logger])

        
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let newCats = json.arrayValue.compactMap { Cat(json: $0) }
                self.cats = newCats
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadPage(_ page: Int) {
        currentPage = page
        fetchCats(page: currentPage)
    }
    
    func increasePage() {
        currentPage += 1
        fetchCats(page: currentPage)
    }
    
    func decreasePage() {
        if currentPage > 0 {
            currentPage -= 1
            fetchCats(page: currentPage)
        }
    }
}

