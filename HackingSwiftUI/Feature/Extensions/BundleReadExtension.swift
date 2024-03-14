//
//  BundleReadExtension.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 14.03.2024.
//

import Foundation

extension Bundle {
    static let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    func decodeList<T: Codable>(key: BundleItems, type: T.Type) -> Array<T> {
        return Bundle.main.decode([T].self, from: key.rawValue)
    }
}

enum BundleItems: String {
    case menu = "menu.json"
}

