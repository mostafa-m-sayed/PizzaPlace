//
//  MenuItemView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 07/08/2023.
//

import SwiftUI

struct MenuItemView: View {
    @State private var addedItem = false
    @Binding var selectedItem: MenuItem
    @ObservedObject var orders: OrderModel
    var body: some View {
        VStack {
            HStack {
                Text(selectedItem.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                if let image = UIImage(named: "\(selectedItem.id)_lg") {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top, .bottom], 5)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180))
                }
            }
            .background(
                .linearGradient(colors: [Color("Surf"), Color("Sky").opacity(0.2)], startPoint: .leading, endPoint: .trailing), in: Capsule())
            .shadow(radius: 5, x: 8, y: 8)
            
            VStack(alignment: .leading) {
                ScrollView {
                    Text(selectedItem.description)
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }
            }
            HStack() {
                Button {
                    addedItem = true
                    orders.addOrder(selectedItem, quantity: 1)
                } label: {
                    Spacer()
                    Text(selectedItem.price, format: .currency(code: "USD"))
                        
                    Image(systemName:  addedItem ?
                          "cart.fill.badge.plus": "cart.badge.plus")
                    Spacer()
                }
                .disabled(selectedItem.id < 0)
                .padding()
                .foregroundColor(.white)
                .bold()
                .background(.red, in: Capsule())
                .shadow(radius: 3)
                .frame(maxWidth: .infinity)
                .padding(5)
            }
           
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(selectedItem: .constant(testMenuItem), orders: OrderModel())
    }
}
