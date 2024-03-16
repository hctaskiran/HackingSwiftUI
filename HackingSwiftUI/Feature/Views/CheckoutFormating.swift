//
//  CheckoutFormating.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 17.03.2024.
//

import SwiftUI

struct CheckoutFormating: View {
    @State private var paymentType: PaymentType = .cash
    
    @State private var addLoyaltyCard = false
    @State private var loyaltyCardNumber = ""
    @State private var amount = ""
    @State private var addTips = false
    @State private var tipAmount: TipAmount = .zero
    @State private var isAlerVisible = false
    
    private func validation() -> Bool {
        if paymentType == PaymentType.Point {
            if loyaltyCardNumber.isEmpty {
                return true
            }
        }
        return false
    }
    
    private var totalPrice: String {
        guard let total = Double(amount) else {return ""}
        let tipValue = total / 100 * Double(tipAmount.rawValue)
        return (total + tipValue).formatted(.currency(code: CurrencyType.dollar.rawValue))
    }
    
    var body: some View {
        VStack {
            Picker("How do you want to pay?", selection: $paymentType) {
                ForEach(PaymentType.allCases, id: \.self) { item in
                    Text("\(item)")
                }
            }.pickerStyle(.navigationLink)
            
            TextField("Amount: ", text: $amount)
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
            
            Button{
                isAlerVisible.toggle()
            } label: {
                Text("Total: \(totalPrice)")
            }
            .buttonStyle(.borderedProminent).foregroundStyle(paymentType == PaymentType.Point && loyaltyCardNumber.isEmpty ? .gray : .white)
            .disabled(validation())
            .navigationTitle("Payment")
            
        }.padding()
            .alert(amount.isEmpty ? "Error" : "Done!", isPresented: $isAlerVisible) {
                Text(amount.isEmpty ? "Failed to pay, please check your amounts"
                     : "Payment \(totalPrice) completed, have a nice day!")
            }
    }
}

#Preview {
    NavigationView {
        CheckoutFormating()
    }
}


