//
//  MainTabView.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 16.03.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ForEach(MainTabViewItems.items) { item in
                item.view.tabItem {
                    Label(item.title, systemImage: item.image.rawValue)
                }
            }
        }
    }
}

#Preview {
    MainTabView().environmentObject(Order())
}

private struct MainTabViewItems: Identifiable {
    let title: String
    let image: SystemImages
    let view: AnyView
    let id = UUID()
    
    init(title: String, image: SystemImages, view: any View) {
        self.title = title
        self.image = image
        self.view = AnyView(view)
    }
    
    static let items: [MainTabViewItems] = [
        MainTabViewItems(title: "Home", image: .home, view: DisplayDetailsWithNavigation()),
        MainTabViewItems(title: "Payment", image: .payment, view: OrderViewEnvironment())
    ]
}
