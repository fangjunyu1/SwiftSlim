//
//  CategoryItem.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/24.
//

protocol CategoryItem: CaseIterable, Identifiable, Hashable {
    var title: String { get }
}
