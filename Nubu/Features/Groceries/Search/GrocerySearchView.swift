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
    var groceryItems: [groceryItem] = [
        groceryItem(id: UUID(), name: "Chicken Breast", store: "Walmart", size_value: 5, size_unit: "lb", price_cents: 2500),
        groceryItem(id: UUID(), name: "Steak", store: "Harmons", size_value: 12, size_unit: "oz", price_cents: 1500),
        groceryItem(id: UUID(), name: "Apples", store: "Target", size_value: 5, size_unit: "ct", price_cents: 1000),
        groceryItem(id: UUID(), name: "Milk", store: "Costco", size_value: 32, size_unit: "fl_oz", price_cents: 500)
    ]
    
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
        List {
            ForEach(groceryItems) { item in
                
            }
        }
    }
}

#Preview {
    GrocerySearchView(onClose: {})
}
