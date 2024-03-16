//
//  CheckoutView.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 16.03.2024.
//

import SwiftUI

struct CheckoutView: View {
//    let paymentTypes: Array<String> = ["Credit Card", "Cash", "Hako Points"]
    @State private var paymentType: PaymentType = .cash
    
    var body: some View {
        Section {
            Picker("How do yo want to pay?", selection: $paymentType) {
                ForEach(PaymentType.allCases, id: \.self) { item in
                    Text("\(item)")
                }
            }
        }
    }
}

enum PaymentType: String, CaseIterable {
    case cash = "Cash"
    case CC = "Credit Card"
    case Point = "Hako Points"
}

#Preview {
    CheckoutView().environmentObject(Order())
}
