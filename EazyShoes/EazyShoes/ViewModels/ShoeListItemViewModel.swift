//
//  ShoeListItemViewModel.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import Foundation

class ShoeListItemViewModel: ObservableObject {
    let shoeDAO = ShoeDAO()
    
    func insertFavorite(shoe: Shoe) {
        shoeDAO.insert(shoe: shoe)
    }
    
    func removeFavorite(shoe: Shoe) {
        shoeDAO.delete(by: shoe.id)
    }
}
