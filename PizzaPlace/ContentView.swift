//
//  ContentView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    var orders: [Int] = [1,2,3,4,6]
    var showOrders: Bool = false
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
            if showOrders {
                OrderView(orders: orders)
            } else {
                MenuItemView()
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                MenuView()
            }
            Spacer()
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
