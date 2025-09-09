//
//  CustomSearchBar.swift
//  Nubu
//
//  Created by Heath, Garrett on 9/5/25.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var text: String
    @FocusState private var focused: Bool

    var body: some View {
        HStack {
            TextField("Search…", text: $text)
                .padding(8)
                .padding(.horizontal, 24) // room for magnifier + X
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.teal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if focused {
                            Button {
                                text = ""
                                focused = false
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16))
                                    .foregroundColor(.teal)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .focused($focused)
        }
        .padding(.horizontal)
    }
}

#Preview("Empty") {
    CustomSearchBar(text: .constant(""))
}
