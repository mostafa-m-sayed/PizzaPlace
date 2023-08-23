//
//  StatusBarView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 15/08/2023.
//

import SwiftUI

struct StatusBarView: View {
    @ObservedObject var orders: OrderModel
    @Binding var showOrders: Bool
    @Binding var isGrid: Bool
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders")
            Spacer()
            
            Button {
                showOrders.toggle()
            } label: {
                Image(systemName: showOrders ? "cart" : "menucard")
            }

            if !showOrders {
                Button {
                    isGrid.toggle()
                } label: {
                    Image(systemName: isGrid ? "square.grid.3x2" : "list.bullet")
                }
                .padding(.leading, 10)
            }
            
            Spacer()
            Label {
                Text(orders.orderTotal, format: .currency(code: "USD"))
            } icon: {
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
            }
        }
        .foregroundColor(.white)
        .font(.title2)
    }
}

struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView(orders: OrderModel(), showOrders: .constant(false), isGrid: .constant(false))
            .background(.black)
    }
}
