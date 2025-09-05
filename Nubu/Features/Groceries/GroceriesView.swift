//
//  GroceriesView.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/3/25.
//

import SwiftUI

struct GroceriesView: View {
    @State private var searchText = ""
    @State private var showSearch = false
    
    var body: some View {
        VStack  {
            HStack {
                Spacer()
                Button(action: {
                    showSearch = true
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .tint(.teal)
                    }
                .padding()
            }
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $showSearch) {
            GrocerySearchView()
                .presentationDragIndicator(.visible)
        }
    }
    
}

#Preview {
    GroceriesView()
}
