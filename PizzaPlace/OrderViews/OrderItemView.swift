//
//  OrderItemView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 16/08/2023.
//

import SwiftUI

struct OrderItemView: View {
    @Binding var orderItem: OrderItem
    @State private var quantity = 1
    @State private var doubleIngredients = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $doubleIngredients) {
                Text("Double Ingredients" + (doubleIngredients ? " Yes" : " No"))
            }
            Stepper(value: $quantity, in: 1...10) {
                Text("\(quantity) \(quantity == 1 ? "Pizza" : "Pizzas")")
            }
        }
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(orderItem: .constant(testOrderItem))
    }
}
