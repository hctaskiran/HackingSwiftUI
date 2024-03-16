//
//  PaymentType.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import Foundation
import SwiftUI

enum PaymentType: String, CaseIterable {
    case cash = "Cash"
    case CC = "Credit Card"
    case Point = "Hako Points"
}
