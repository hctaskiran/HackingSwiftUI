//
//  DisplayDetailsWithNavigation.swift
//  HackingSwiftUI
//
//  Created by Haktan Can Taşkıran on 15.03.2024.
//


import SwiftUI


struct DisplayDetailsWithNavigation: View {
    private let menuSection: [MenuSection]
    
    init() {
        menuSection = Bundle.main.decodeList(key: .menu, type: MenuSection.self)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuSection) { section in
                    Section {
                        ForEach(section.items) {item in
                            NavigationLink {
                                ItemDetailView(item: item)
                            } label: {
                                ItemRow(item: item)
                            }
                        }
                    } header: {
                        Text(section.name).font(.headline)
                    } footer: {
                        Text("We have \(section.items.count.description) amounts of this section")
                    }
                }
            }
            .navigationDestination(for: MenuItem.self, destination: {item in
            ItemDetailView(item: item)
            })
            .navigationTitle("Menu")
            .listStyle(.grouped)
            }
        
        }
    }
    
 private struct ItemRow: View {
        let item: MenuItem
        private let circle = Circle()
        
        var body: some View {
            HStack {
                Image(item.thumbnailImage).circleShapeWithBorder()
                VStack(alignment: .leading) {
                    Text(item.name)
                    HStack{
                        Text("$\(item.price)")
                        Spacer()
                        ForEach(item.restrictions, id: \.self) {restrictions in
                                Text(restrictions).restrictStyle()
                                .background(RestrictionColors.setColor(value: restrictions))
                                
                    }
                    }
                }
            }
            
        }
    }
    
struct DisplayDetailsWithNavigation_Preview: PreviewProvider {
    static var previews: some View {
        DisplayDetailsWithNavigation()
    }
}

private extension Text {
    func restrictStyle() -> some View {
        return self.font(.caption)
            .fontWeight(.bold)
            .padding(5)
            .clipShape(Circle())
            .foregroundColor(.white)
    }
}

private enum RestrictionColors: String {
    case D
    case G
    case N
    case V
    
    static func setColor(value: String) -> Color {
        switch value {
        case RestrictionColors.D.rawValue:
            return Color.purple
        case RestrictionColors.G.rawValue:
            return Color.black
        case RestrictionColors.N.rawValue:
            return Color.blue
        case RestrictionColors.V.rawValue:
            return Color.green
        default:
            return Color.yellow
        }
    }
}



 
