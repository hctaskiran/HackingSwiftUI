//
//  ComposingListRowView.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 14.03.2024.
//

import SwiftUI

struct ComposingListRowView: View {
    private let menuSection: [MenuSection]
    
    init() {
        menuSection = Bundle.main.decodeList(key: .menu, type: MenuSection.self)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuSection) { section in
                    Section {
                        ForEach(section.items) {item in
                            ItemRow(item: item)
                        }
                    } header: {
                        Text(section.name)
                    } footer: {
                        Text(section.items.count.description)
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
            }
        
        }
    }
    
    struct ItemRow: View {
        let item: MenuItem
        
        var body: some View {
            HStack {
                Image(item.thumbnailImage)
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text("$\(item.price)")
                }
            }
            
        }
    }
    
struct ComposingListRowView_Preview: PreviewProvider {
    static var previews: some View {
        ComposingListRowView()
    }
}
