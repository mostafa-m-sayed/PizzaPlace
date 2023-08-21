//
//  RatingsView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 07/08/2023.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    var body: some View {
        HStack {
            ForEach(1...6, id: \.self) { item in
                Image(systemName: item <= rating ? "fork.knife.circle.fill" : "circle")
            }
        }
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(rating: 4)
    }
}
