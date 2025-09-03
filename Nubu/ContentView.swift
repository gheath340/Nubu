//
//  ContentView.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/3/25.
//

import SwiftUI

enum Tab: Hashable {
    case home, budget, diary, groceries
}

struct ContentView: View {
    @State private var selection: Tab = .home

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                HomeView()
            }
            .tabItem { Label("Home", systemImage: "house") }
            .tag(Tab.home)

            NavigationStack {
                BudgetView()
            }
            .tabItem { Label("Budget", systemImage: "dollarsign.circle") }
            .tag(Tab.budget)

            NavigationStack {
                DiaryView()
            }
            .tabItem { Label("Diary", systemImage: "book") }
            .tag(Tab.diary)
            
            NavigationStack {
                GroceriesView()
            }
            .tabItem { Label("Groceries", systemImage: "cart") }
            .tag(Tab.groceries)
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
