//
//  SearchItem.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/11/25.
//

import SwiftUI

struct SearchItem: View {
    var item: groceryItem
    
    var body: some View {
        HStack {
            Text(item.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
            
            Text(item.store)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("$\(item.price_per_unit_string)/\(item.size_unit)")
                .font(.subheadline)
                .foregroundColor(.primary)
        }
        .padding()

    }
}

#Preview {
    VStack(spacing: 2) {
            SearchItem(item: groceryItem(
                id: UUID(),
                name: "Chicken Breast",
                store: "Walmart",
                size_value: 5,
                size_unit: "lb",
                price_cents: 2500
            ))
            
            SearchItem(item: groceryItem(
                id: UUID(),
                name: "Milk",
                store: "Costco",
                size_value: 32,
                size_unit: "fl_oz",
                price_cents: 500
            ))
        }
}
