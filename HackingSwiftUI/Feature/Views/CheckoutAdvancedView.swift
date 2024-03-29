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
        if paymentType == PaymentType.Point {
            if loyaltyCardNumber.isEmpty {
                return true
            }
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
            
            if paymentType == PaymentType.Point {
                Toggle("Add your loyalty card", isOn: $addLoyaltyCard)
                
                if addLoyaltyCard {
                    TextField("Enter your Hako ID: ", text: $loyaltyCardNumber)
                }
            }
            
            Toggle("Add tip?", isOn: $addTips)
            
            if addTips {
                Text("Tip amount in percentage")
                Picker("Tip amount in percentage", selection: $tipAmount) {
                    ForEach(TipAmount.allCases, id: \.self) { item in
                        Text("\(item.rawValue)")
                    }
                }.pickerStyle(.segmented)
            }
            Spacer()
            
            Button{} label: {
                Text("Complete")
            }
            .buttonStyle(.borderedProminent).foregroundStyle(loyaltyCardNumber.isEmpty ? .gray : .purple)
            .disabled(validation())
            
        }.padding()
            .navigationTitle("Payment")
    }
}

#Preview {
    NavigationView {
        CheckoutAdvancedView()
    }
}
