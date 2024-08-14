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
    @Published var pageSize: Int = 10 // Default page size
    private var currentPage = 0
    private let apiKey = "24be637f-e596-4847-b47a-1791feeea1bd"
    
    var currentPagePublic: Int {
          return currentPage
      }
      
    func fetchCats(page: Int, limit: Int) {
        let url = "https://api.thecatapi.com/v1/images/search?limit=\(limit)&page=\(page)&order=Desc&api_key=\(apiKey)"
        addLogger()
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
        fetchCats(page: currentPage, limit: pageSize)
    }
    
    func increasePage() {
        currentPage += 1
        fetchCats(page: currentPage, limit: pageSize)
    }
    
    func decreasePage() {
        if currentPage > 0 {
            currentPage -= 1
            fetchCats(page: currentPage, limit: pageSize)
        }
    }
    
    func updatePageSize(to newSize: Int) {
        pageSize = newSize
        loadPage(0) // Reload from the first page with the new page size
    }
}



 func addLogger() {
    // Create an instance of your logger
    let logger = NetworkLogger()
    
    // Create a session configuration (optional)
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 30 // Example: set request timeout interval
    
    // Create an Alamofire Session with the logger
    let session = Session(configuration: configuration, eventMonitors: [logger])
}
