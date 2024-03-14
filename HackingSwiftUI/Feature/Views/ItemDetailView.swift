//
//  ItemDetailView.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 15.03.2024.
//

import SwiftUI

struct ItemDetailView: View {
    let item: MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text("Photo: \(item.photoCredit)").photoCreditStyle()
                    
            }
            Text(item.description)
                .padding()
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDataDetailView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ItemDetailView(item: MenuItem.example)
        }
    }
}

private extension Text {
    func photoCreditStyle() -> some View {
        return self.padding(4)
            .background(.black)
            .font(.caption)
            .foregroundColor(.white)
            .offset(x: -20, y: -10)
    }
}
