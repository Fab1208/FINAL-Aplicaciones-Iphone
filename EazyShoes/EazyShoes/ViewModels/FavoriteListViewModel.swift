//
//  FavoriteListViewModel.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    @Published var favorites: [FavoriteShoe] = []
    
    let shoeDAO = ShoeDAO()
    
    func getFavorites() {
        favorites = shoeDAO.fetchAll()
    }
    
    func removeFavorite(indexSet: IndexSet) {
        guard let index = indexSet.first else {
            return
        }
        
        shoeDAO.delete(by: Int(favorites[index].id))
    }
}
