//
//  OrderRowView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 07/08/2023.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    var itemPrice = 19.90
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack {
                HStack {
                    Text(order.item.name)
                    Spacer()
                }
                HStack {
                    Text(order.quantity, format: .number)
                    Text(order.item.price, format: .currency(code: "USD"))
                    Spacer()
                }
            }
            .padding(5)
            
            Spacer()
            Text(order.extPrice, format: .currency(code: "USD"))
                .fontWeight(.semibold)
                .padding(.trailing, 5)
        }
        .background(.regularMaterial)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: .constant(testOrderItem))
    }
}
