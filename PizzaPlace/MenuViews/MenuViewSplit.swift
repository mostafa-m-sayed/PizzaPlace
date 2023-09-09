//
//  MenuViewSplit.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 09/09/2023.
//

import SwiftUI

struct MenuViewSplit: View {
    var menu: [MenuItem]
    @State private var selectedItem: MenuItem? = nil
    
    var body: some View {
        NavigationSplitView {
            List(menu, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    MenuRowView(item: item)
                }
            }
        } detail: {
            MenuDetailView(item: $selectedItem)
        }
    }
}

struct MenuViewSplit_Previews: PreviewProvider {
    static var previews: some View {
        MenuViewSplit(menu: MenuModel().menu)
    }
}
