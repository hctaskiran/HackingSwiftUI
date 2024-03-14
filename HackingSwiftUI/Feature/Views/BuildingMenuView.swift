//
//  BuildingMenuView.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 14.03.2024.
//

import SwiftUI

struct BuildingMenuView: View {
    private let title: String = "Menu"
    private let menuItem: [MenuSection]
    
    init() {
        menuItem = Bundle.main.decodeList(key: .menu, type: MenuSection.self)
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(menuItem) { section in
                    MenuSectionView(menuSection: section)
                }
            }
            .navigationTitle(title)
            .listStyle(.grouped )
        }
    }
}

#Preview {
    BuildingMenuView()
}

private struct MenuSectionView: View {
    
    let menuSection: MenuSection
    var body: some View {
        Section {
            ForEach(menuSection.items) { item in
                Text(item.name)
            }
        } header: {
            Text(menuSection.name)
        } footer: {
            Text("We have \(menuSection.items.count.description) different meals for this category")
        }
    }
}
