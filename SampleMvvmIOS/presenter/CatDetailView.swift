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
        VStack {
            KFImage(URL(string: cat.url))
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Cat ID: \(cat.id)")
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
