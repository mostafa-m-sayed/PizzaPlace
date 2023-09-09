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
                NavigationStack {
                    List($orders.orderItems) { $order in
                        NavigationLink(value: order) {
                            OrderRowView(order: $order)
                                .padding(.bottom, 5)
                                .padding([.leading, .trailing], 7)
                        }.navigationDestination(for: OrderItem.self) { order in
                            OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                        }.navigationTitle("Your order")
                    }
                }
                .padding(.top, 68)

            Button("Delete last") {
                if !orders.orderItems.isEmpty {
                    orders.removeLast()
                }
            }
            .padding(5)
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(.regularMaterial)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orders: OrderModel())
    }
}
