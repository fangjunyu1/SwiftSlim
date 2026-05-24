//
//  EditButtonFallbackDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/24.
//

import SwiftUI

struct EditButtonFallbackDemo: View {
    @State private var editItems = ["Text", "Image", "Button"]  // EditButton
    
    private var navigationHeight = 280.0
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                List {
                    ForEach(editItems, id: \.self) { item in
                        Text(verbatim: item)
                    }
                    .onDelete { offsets in
                        editItems.remove(atOffsets: offsets)
                    }
                }
                .navigationTitle("Items")
                .toolbar {
                    EditButton()
                }
            }
            .frame(height: navigationHeight)
        } else {
            NavigationView {
                List {
                    ForEach(editItems, id: \.self) { item in
                        Text(verbatim: item)
                    }
                    .onDelete { offsets in
                        editItems.remove(atOffsets: offsets)
                    }
                }
                .navigationTitle("Items")
                .toolbar {
                    EditButton()
                }
            }
            .frame(height: navigationHeight)
        }
    }
}
