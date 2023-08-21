//
//  MenuView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 07/08/2023.
//

import SwiftUI

struct MenuView: View {
    var menu: [MenuItem]
    @Binding var selectedItem: MenuItem
    var body: some View {
        List(MenuCategory.allCases, id: \.self) { category in
            Section {
                let filteredMenu = menu.filter { $0.category == category}
                ForEach(filteredMenu) { item in
                    MenuRowView(item: item)
                        .onTapGesture {
                            self.selectedItem = item
                        }
                }
            } header: {
                Text(category.rawValue)
                    .padding(.bottom)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
    }
}
