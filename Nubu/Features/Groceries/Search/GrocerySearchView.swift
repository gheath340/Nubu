//
//  GrocerySearchView.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/4/25.
//

import SwiftUI

struct GrocerySearchView: View {
    @Environment(\.dismiss) var dismiss
    @State private var query = ""
    
    var body: some View {
        VStack(alignment: .leading)  {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.left")
            }
            .padding(.leading)
            .tint(.teal)
            
            CustomSearchBar(text: $query)
        }
    }
}

#Preview {
    GrocerySearchView()
}
