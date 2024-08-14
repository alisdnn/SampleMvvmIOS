//
//  CatGridView.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-11.
//

import SwiftUI
import Kingfisher
import SwiftyJSON

struct CatGridView: View {
    @StateObject var viewModel = CatViewModel()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.cats) { cat in
                        NavigationLink(destination: CatDetailView(cat: cat)) {
                            CatGridItemView(cat: cat)
                        }
                    }
                }
            }
            
            // Pagination Controls
            HStack {
                Button(action: {
                    viewModel.decreasePage()
                }) {
                    Text("Previous")
                }
                .padding()
                .disabled(viewModel.currentPage == 0) // Disable if on the first page

                Spacer()

                Button(action: {
                    viewModel.increasePage()
                }) {
                    Text("Next")
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchCats(page: viewModel.currentPage) // Fetch initial data
        }
        .navigationBarTitle("Cats")
    }
}

struct CatGridItemView: View {
    let cat: Cat
    
    var body: some View {
        KFImage(URL(string: cat.url))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
            .clipped()
    }
}


#Preview {
    CatGridView(viewModel: CatViewModel())
}


#Preview {
    CatGridItemView(cat: Cat(json: JSON([ "height": 720,
                                        "id" : "r5FkDFDre",
                       "url" : "https://cdn2.thecatapi.com/images/r5FkDFDre.jpg",
                       "width" : 1280])))
}
