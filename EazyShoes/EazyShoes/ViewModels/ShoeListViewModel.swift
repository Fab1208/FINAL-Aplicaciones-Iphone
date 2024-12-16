//
//  ShoeListViewModel.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import Foundation

class ShoeListViewModel: ObservableObject {
    @Published var shoes: [Shoe] = []
    @Published var errorMessage = ""
    @Published var isLoading = false
    @Published var selectedCategory = "Women"
    
    let service = ShoeService()
    
    func updateCategory(category: String) {
        self.selectedCategory = category
        getShoes()
    }
    
    func getShoes() {
        isLoading = true
        
        var gender: String
        
        switch selectedCategory {
        case "Men":
            gender = "MEN"
        case "Kids":
            gender = "KIDS"
        default:
            gender = "WOMEN"
        }
        
        service.getShoes(gender: gender) { shoes, message in
            DispatchQueue.main.async {
                if let shoes = shoes {
                    self.shoes = shoes
                }
                
                if let message = message {
                    self.errorMessage = message
                }
                
                self.isLoading = false
            }
        }
    }
}
