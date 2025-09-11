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
struct groceryItem: Codable, Identifiable, Equatable, Hashable {
    let id: UUID
    let name: String
    let store: String
    let size_value: Double
    let size_unit: String
    let price_cents: Double
}

@MainActor
final class GrocerySearchVM: ObservableObject {
    @Published var groceryItems: [groceryItem] = []
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
