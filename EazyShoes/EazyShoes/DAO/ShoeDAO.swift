//
//  ShoeDAO.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import Foundation
import CoreData

class ShoeDAO {
    
    let context = PersistenceController.shared.container.viewContext
    
    func insert(shoe: Shoe) {
        let favorite = FavoriteShoe(context: context)
        
        favorite.id = Int32(shoe.id)
        favorite.name = String(shoe.name)
        favorite.price = Int32(shoe.price)
        favorite.image = String(shoe.image)
        favorite.gender = String(shoe.gender)
        favorite.brand = String(shoe.brand)
        
        saveContext()
    }
    
    func delete(by id: Int) {
        let request = NSFetchRequest<FavoriteShoe>(entityName: "FavoriteShoe")
        request.predicate = NSPredicate(format: "id == %i", id)
        
        do {
            let favorites = try context.fetch(request)
            for favorite in favorites {
                context.delete(favorite)
            }
            
            saveContext()
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchAll() -> [FavoriteShoe] {
        let request = NSFetchRequest<FavoriteShoe>(entityName: "FavoriteShoe")
        
        do {
            return try context.fetch(request)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
        
        return []
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
