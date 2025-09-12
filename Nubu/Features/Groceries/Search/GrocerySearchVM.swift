//
//  GrocerySearchVM.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/4/25.
//

import Foundation
//What do i want the search screen to look like??
    //Item name     Store   Price per unit
    //Click on item to get more info and to choose to add and how many units to add
@MainActor
final class GrocerySearchVM: ObservableObject {
    @Published var groceryItems: [groceryItem] = [
        groceryItem(id: UUID(), name: "Chicken Breast", store: "Walmart", size_value: 5, size_unit: "lb", price_cents: 2500),
        groceryItem(id: UUID(), name: "Steak", store: "Harmons", size_value: 12, size_unit: "oz", price_cents: 1500),
        groceryItem(id: UUID(), name: "Apples", store: "Target", size_value: 5, size_unit: "ct", price_cents: 1000),
        groceryItem(id: UUID(), name: "Milk", store: "Costco", size_value: 32, size_unit: "fl_oz", price_cents: 500)
    ]
    @Published var log: String = ""
    private var tableName: String = "catalog_items"
    
    func loadItems() async {
        do {
            let rows: [groceryItem] = try await supabase
                .from(tableName)
                .select("*")
                .execute()
                .value
            
            groceryItems = rows
            log = "Loaded \(rows.count) rows"
        } catch {
            log = "Select error: \(error.localizedDescription)"
            print(error)
        }
    }
}
