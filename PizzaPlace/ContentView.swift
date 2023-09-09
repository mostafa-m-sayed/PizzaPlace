//
//  ContentView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuItem]
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders: Bool = false
    @State private var selectedItem: MenuItem = noMenuItem
    @State var isGrid = false
    var body: some View {
        TabView {
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(orders: orders, showOrders: $showOrders, isGrid: $isGrid)
                    .font(.title2)
                    .foregroundStyle(.white)
//                MenuItemView(selectedItem: $selectedItem, orders: orders)
//                    .padding(5)
//                    .background(.thinMaterial)
//                    .cornerRadius(10)
//                if isGrid {
//                    MenuGridView(menu: menu, favourites: [], selectedItem: $selectedItem)
//                } else {
//                    MenuView(menu: menu, selectedItem: $selectedItem)
//                }
                MenuViewSplit(menu: menu)
            }.tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(orders: orders, showOrders: $showOrders, isGrid: $isGrid)
                    .font(.title2)
                    .foregroundStyle(.white)
                //            if showOrders {
                OrderView(orders: orders)
                    .cornerRadius(10)
            }.tabItem {
                Label("Order", systemImage: "cart")
            }
            
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menu: MenuModel().menu)
            
    }
}
