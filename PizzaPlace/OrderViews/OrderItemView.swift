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
    @State private var pizzaCrust: PizzaCrust
    @State private var name: String = ""
    @State private var comments: String = ""

    init(orderItem: Binding<OrderItem>) {
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            Toggle(isOn: $doubleIngredients) {
                Text("Double Ingredients" + (doubleIngredients ? " Yes" : " No"))
            }
            Stepper(value: $quantity, in: 1...10) {
                Text("\(quantity) \(quantity == 1 ? "Pizza" : "Pizzas")")
            }
            HStack {
                Picker(selection: $pizzaCrust, content: {
                    ForEach(PizzaCrust.allCases, id: \.self) { crust in
                        Text(crust.rawValue).tag(crust)
                    }
                }, label: {
                    Text("Pizza Crust")
                })
                .pickerStyle(.menu)
                Spacer()
            }
            VStack {
                HStack {
                    Text("Comments")
                    Spacer()
                }
                HStack {
                    TextEditor(text: $comments)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .shadow(radius: 1)

            Spacer()
        }
        .padding()
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(orderItem: .constant(testOrderItem))
    }
}
