//
//  CatGridView.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-11.
//
import SwiftUI
import Combine
import Alamofire
import SwiftyJSON
import Kingfisher


struct CatGridView: View {
    @StateObject var viewModel = CatViewModel()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            // Page Size Selector
            HStack {
                Text("Select Page Size:")
                    .font(.headline)
                
                ForEach([5, 10, 20, 50], id: \.self) { size in
                    Button(action: {
                        viewModel.updatePageSize(to: size)
                    }) {
                        Text("\(size)")
                            .padding(8)
                            .background(viewModel.pageSize == size ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            // ScrollViewReader provides a proxy for scrolling
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.cats) { cat in
                            NavigationLink(destination: CatDetailView(cat: cat)) {
                                CatGridItemView(cat: cat)
                            }
                            .id(cat.id) // Assign an ID for each item in the grid
                        }
                    }
                    .onChange(of: viewModel.currentPagePublic) {
                        // Scroll to the top when the page changes
                        withAnimation {
                            if let firstCat = viewModel.cats.first {
                                scrollViewProxy.scrollTo(firstCat.id, anchor: .top)
                            }
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
                .disabled(viewModel.currentPagePublic == 0) // Disable if on the first page
                
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
            viewModel.fetchCats(page: viewModel.currentPagePublic, limit: viewModel.pageSize) // Fetch initial data
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
