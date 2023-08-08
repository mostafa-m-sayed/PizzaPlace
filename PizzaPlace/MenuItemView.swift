//
//  MenuItemView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 07/08/2023.
//

import SwiftUI

struct MenuItemView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Margherita Pizza Place")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                    .padding(.leading)
                if let image = UIImage(named: "0_lg") {
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
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut urna ex, vehicula sed porta sit amet, faucibus id sapien. Maecenas pharetra, urna id efficitur luctus, orci metus sagittis magna, a lobortis turpis dolor quis lorem. Phasellus eleifend risus eros, ut sollicitudin sapien tempor at. In pretium pulvinar pellentesque. Vivamus pretium.")
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }
            }
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView()
    }
}
