//
//  PizzaPlaceApp.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 04/08/2023.
//

import SwiftUI

@main
struct PizzaPlaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(menu: MenuModel().menu)
        }
    }
}
