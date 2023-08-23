//
//  MenuGridView.swift
//  PizzaPlace
//
//  Created by Mostafa Sayed on 22/08/2023.
//

import SwiftUI

struct MenuGridView: View {
    @State var menu: [MenuItem]
    @State var favourites: [MenuItem]
    @Binding var selectedItem: MenuItem
    
    let columnLayout = Array(repeating: GridItem(), count: 3)
    let favColumnLayout = Array(repeating: GridItem(), count: 5)
    @Namespace private var nSpace
    var body: some View {
        VStack {
            LazyVGrid(columns: columnLayout) {
                ForEach(favourites.sorted(by: {$0.name < $1.name})) { item in
                    FavoriteTileView(menuItem: item)
                        .matchedGeometryEffect(id: item.id, in: nSpace)
                        .onTapGesture {
                            selectedItem = item
                        }
                        .onLongPressGesture {
                            favourites.removeAll(where: {$0.id == item.id})
                        }
                }
            }
            .padding()
            Text(selectedItem.name)
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(menu) { item in
                        if !favourites.contains(item) {
                            MenuItemTileView(menuItem: item)
                                .matchedGeometryEffect(id: item.id, in: nSpace)
                                .onTapGesture(count: 2) {
                                    if favourites.contains(item) {
                                        return
                                    }
                                    favourites.append(item)
                                }
                                .onTapGesture {
                                    selectedItem = item
                                }
                                .animation(.easeOut, value: favourites)
                        }
                    }
                }
                .padding()
            }
        }
        .animation(.easeOut, value: favourites)
    }
}

struct MenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        MenuGridView(menu: MenuModel().menu, favourites: [], selectedItem: .constant(testMenuItem))
    }
}
