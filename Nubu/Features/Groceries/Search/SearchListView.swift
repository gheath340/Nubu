//
//  SearchListView.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/15/25.
//

import SwiftUI

struct SearchListView: View {
    @StateObject private var viewModel = GrocerySearchVM()
    @State private var showList = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.groceryItems) { item in
                    VStack(spacing: 0) {
                        SearchItem(item: item)
                    }
                }
            }
        }
        .task {
            await viewModel.loadItems()
        }
        .opacity(showList ? 1 : 0)
        .onAppear {
            withAnimation(.easeInOut.delay(0.2)) {
                showList = true
            }
        }
    }
}

#Preview {
    SearchListView()
}
