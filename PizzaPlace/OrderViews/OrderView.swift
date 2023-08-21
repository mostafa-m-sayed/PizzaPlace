//
//  OrderView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 07/08/2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders: OrderModel

    var body: some View {
        VStack {
            ZStack(alignment: .top ) {
                ScrollView {
                    ForEach($orders.orderItems) { order in
                        OrderRowView(order: order)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing], 7)
                    }
                }
                .padding(.top, 68)
                HStack {
                    Text("Order Pizza")
                        .font(.title)
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial)
            }
            .padding(5)
            Button("Delete last") {
                if !orders.orderItems.isEmpty {
                    orders.removeLast()
                }
            }
            .padding(5)
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(Color("Surf"))
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: OrderModel())
    }
}
