//
//  GrocerySearchView.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/4/25.
//

import SwiftUI

struct GrocerySearchView: View {
    @StateObject private var viewModel = GrocerySearchVM()
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
        List(viewModel.groceryItems) { item in
            VStack(spacing: 0) {
                SearchItem(item: item)
                Divider()
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .background(Color.gray.opacity(0.3))
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        
    }
}

#Preview {
    GrocerySearchView(onClose: {})
}
