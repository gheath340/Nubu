//
//  TestViewModel.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/1/25.
//

import Foundation
import Supabase

struct TestItem: Codable, Identifiable {
    let id: Int
    let name: String
}

@MainActor
final class TestViewModel: ObservableObject {
    @Published var items: [TestItem] = []
    @Published var log: String = ""
    
    private let table = "test_table"
    
    func loadItems() async {
        do {
            let rows: [TestItem] = try await supabase
                .from(table)
                .select("*")
                .execute()
                .value
            
            items = rows
            log = "Loaded \(rows.count) rows"
        } catch {
            log = "Select error: \(error.localizedDescription)"
            print(error)
        }
    }
    
    func addItem(name: String) async {
        do {
            try await supabase
                .from(table)
                .insert(["name": name])
                .execute()
            
            await loadItems()
            log = "Inserted row"
        } catch {
            log = "Inser error: \(error.localizedDescription)"
            print(error)
        }
    }
}


