//
//  SearchItem.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/11/25.
//

import SwiftUI

struct SearchItem: View {
    var item: groceryItem
    var price_per_unit: Double{(Double(item.price_cents) / 100.0) / Double(item.size_value)}
    var price_per_unit_string: String {String(format : "%.2f", price_per_unit)}
    
    var body: some View {
        HStack {
            Text(item.name)
            Text(item.store)
            Text("$\(price_per_unit_string)/\(item.size_unit)")
        }
    }
}

#Preview {
    SearchItem(item: groceryItem(id: UUID(), name: "Chicken Breast", store: "Walmart", size_value: 5, size_unit: "lb", price_cents: 2500))
}
