//
//  GroceryItemModel.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/12/25.
//

import Foundation

struct groceryItem: Codable, Identifiable, Equatable, Hashable {
    let id: UUID
    let name: String
    let store: String
    let size_value: Double
    let size_unit: String
    let price_cents: Double
    var price_per_unit: Double{(Double(price_cents) / 100.0) / Double(size_value)}
    var price_per_unit_string: String {String(format : "%.2f", price_per_unit)}
}


