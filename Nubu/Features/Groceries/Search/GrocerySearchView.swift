//
//  GrocerySearchView.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/4/25.
//

import SwiftUI

struct GrocerySearchView: View {
    @State private var query = ""
    var onClose: () -> Void
    
    var body: some View {
        VStack(alignment: .leading)  {
            Button(action: {
                withAnimation(.easeInOut) {
                    onClose()
                }
            }) {
                Image(systemName: "arrow.left")
            }
            .font(.title2)
            .padding()
            .padding(.bottom, -4)
            .tint(.teal)
            
            CustomSearchBar(text: $query)
        }
        Spacer()
        SearchListView()
    }
}

#Preview {
    GrocerySearchView(onClose: {})
}
