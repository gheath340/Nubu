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
struct GroceryItem: Codable, Identifiable, Equatable {
    let id: UUID
    let name: String
    let store: String
    
}
