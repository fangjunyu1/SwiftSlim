//
//  TableFallbackDemo.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/6/23.
//

import SwiftUI

private struct DemoPerson: Identifiable {
    let id = UUID()
    let name: String
    let role: String
}

struct TableFallbackDemo: View {
    
    private let tablePeople: [DemoPerson] = [
        .init(name: "Junyu", role: "Developer"),
        .init(name: "Ming", role: "Designer"),
        .init(name: "Luna", role: "Product")
    ]
    
    var body: some View {
        VStack {
            if #available(iOS 16.0, *) {
                Table(tablePeople) {
                    TableColumn(String("Name"), value: \.name)
                    TableColumn(String("Role"), value: \.role)
                }
                .frame(height: 180)
            } else {
                if UIDevice.isPhone {
                    // iPhone 显示 Table
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(tablePeople) { person in
                                VStack(spacing: 8) {
                                    Text(verbatim: person.name)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.vertical, 6)
                                    Divider()
                                }
                            }
                        }
                        .padding()
                        .background()
                    }
                } else {
                    // iPad 和 Mac 显示 Table
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(verbatim: "Name")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color.accentColor)
                            
                            Text(verbatim: "Role")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color.accentColor)
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        ForEach(tablePeople) { person in
                            VStack(spacing: 6) {
                                HStack {
                                    Text(verbatim: person.name)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.vertical, 6)
                                    
                                    Text(verbatim: person.role)
                                        .foregroundStyle(Color.gray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                Divider().opacity(0.5)
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                    .padding()
                    .background()
                }
            }
        }
    }
}


#Preview {
    TableFallbackDemo()
}
