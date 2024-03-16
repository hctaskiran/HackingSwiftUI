//
//  CheckoutAdvancedView.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 16.03.2024.
//

import SwiftUI

struct CheckoutAdvancedView: View {
    @State private var paymentType: PaymentType = .cash
    
    @State private var addLoyaltyCard = false
    @State private var loyaltyCardNumber = ""
    @State private var addTips = false
    @State private var tipAmount: TipAmount = .zero
    
    private func validation() -> Bool {
        if loyaltyCardNumber.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack {
            Picker("How do you want to pay?", selection: $paymentType) {
                ForEach(PaymentType.allCases, id: \.self) { item in
                Text("\(item)")
                }
            }.pickerStyle(.navigationLink)
            
            Toggle("Add your loyalty card", isOn: $addLoyaltyCard)
            
            if addLoyaltyCard {
                TextField("Enter your Hako ID: ", text: $loyaltyCardNumber)
                
                Picker("Tip amount in percentage", selection: $tipAmount) {
                    ForEach(TipAmount.allCases, id: \.self) { item in
                        Text("\(item.rawValue)")
                    }
                }.pickerStyle(.navigationLink)
            }
            Spacer()
            
            Button{} label: {
                Text("Complete")
            }
            .buttonStyle(.borderedProminent).foregroundStyle(loyaltyCardNumber.isEmpty ? .gray : .white)
            .disabled(validation())
            
        }.padding()
            .navigationTitle("Payment")
    }
}
 
enum TipAmount: Int, CaseIterable {
    case zero = 0
    case five = 5
    case ten = 10
    case fifteen = 15
    case twenty = 20
    case twentyfive = 25
    case thirty = 30
}

#Preview {
    NavigationView {
        CheckoutAdvancedView()
    }
}
