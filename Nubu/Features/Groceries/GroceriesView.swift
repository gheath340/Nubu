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
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            VStack  {
                HStack {
                    Spacer()
                    if !showSearch {
                        Button(action: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                showSearch = true
                            }
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .tint(.teal)
                        }
                        .matchedGeometryEffect(id: "searchView", in: animation)
                        .padding(.trailing)
                    }
                }
                Spacer()
            }
            .padding()
            
                if showSearch {
                    VStack {
                        GrocerySearchView {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                showSearch = false
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.systemBackground))
                    .matchedGeometryEffect(id: "searchView", in: animation)
                    .zIndex(1)
            }
        }
    }
    
}

#Preview {
    GroceriesView()
}
