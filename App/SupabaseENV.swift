//
//  SupabaseENV.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/1/25.
//

import Foundation

enum SupabaseEnv {
    static let url: URL = {
        guard let raw = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String,
              let url = URL(string: raw)
        else { fatalError("Missing SUPABASE_URL in Info.plist") }
        return url
    }()

    static let anonKey: String = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_ANON_KEY") as? String
        else { fatalError("Missing SUPABASE_ANON_KEY in Info.plist") }
        return key
    }()
}
