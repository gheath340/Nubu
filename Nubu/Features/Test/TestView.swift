//
//  TestView.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/1/25.
//

import SwiftUI

struct TestView: View {
    @StateObject private var vm = TestViewModel()
    @State private var name = "Test"

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            HStack {
                TextField("Name to insert…", text: $name)
                    .textFieldStyle(.roundedBorder)

                Button("Insert") {
                    Task {
                        await vm.addItem(name: name)
                        name = ""
                    }
                }
                .buttonStyle(.borderedProminent)
            }

            Button("Reload") {
                Task { await vm.loadItems() }
            }
            .buttonStyle(.bordered)

            Divider()

            Text(vm.log)
                .font(.system(.footnote, design: .monospaced))
                .foregroundStyle(.secondary)

            List(vm.items) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text("id: \(item.id)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .task { await vm.loadItems() }
    }
}

#Preview {
    TestView()
}
