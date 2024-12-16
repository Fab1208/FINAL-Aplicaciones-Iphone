//
//  PersistenceController.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import Foundation
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "EazyShoesModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description , error in
            if let error = error {
                fatalError("Error loading Core Data Stores: \(error)")
            }
        }
    }
}
