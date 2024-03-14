//
//  Image+Extension.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 15.03.2024.
//

import Foundation
import SwiftUI


extension Image {
    func circleShapeWithBorder() -> some View {
        return self.clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 3))
    }
}
