//
//  ContentView.swift
//  SampleMvvmIOS
//
//  Created by ali sadeghian on 2024-08-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CatGridView()
                .navigationBarTitle("Cats")
        }
    }
}

#Preview {
    ContentView()
}
