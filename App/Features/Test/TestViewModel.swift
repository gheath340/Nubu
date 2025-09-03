//
//  TestViewModel.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/1/25.
//

import Foundation
import Supabase

private let TABLE = "test_table"

struct TestItem: Codable, Identifiable {
    let id: Int
    let name: String
}

func loadItems() async {
    let client = SupabaseClient(supabaseURL: SupabaseENV.SUPABASE_URL, supabaseKey: SupabaseENV.SUPABASE_ANON_KEY)
}
