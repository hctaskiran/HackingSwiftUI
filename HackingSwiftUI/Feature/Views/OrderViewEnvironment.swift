//
//  OrderViewEnvironment.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 16.03.2024.
//

import SwiftUI

struct OrderViewEnvironment: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("\(item.price)")
                            Button("Order now!") {
                                order.add(item: item)
                            }.buttonStyle(.borderedProminent)
                        }
                    }
                    
                    Section {
                        NavigationLink("Place Order") {
                                Text("Checkout")
                        }
                    }
                }
                
            }
        }

    }
}

#Preview {
    OrderViewEnvironment().environmentObject(Order())
}
