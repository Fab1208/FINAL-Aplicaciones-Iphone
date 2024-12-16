//
//  ShoeService.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import Foundation

class ShoeService {
    
    func getShoes(gender: String, completion: @escaping ([Shoe]?, String?) -> Void) {
        let url = "https://chrome-accidental-match.glitch.me/shoes?gender=\(gender)"
        
        HttpRequestHelper().GET(url: url) { succes, data, message in
            if succes {
                guard let data = data else {
                    completion(nil, "Error: \(message ?? "No data")")
                    print("Error: \(message ?? "No data")")
                    return
                }
                do {
                    let shoesResponse = try JSONDecoder().decode([ShoeResponse].self, from: data)
                    let shoes = shoesResponse.map { shoeResponse in
                        Shoe(id: shoeResponse.id, name: shoeResponse.name, price: shoeResponse.price, image: shoeResponse.image, brand: shoeResponse.brand, gender: shoeResponse.gender)
                    }
                    completion(shoes, nil)
                } catch let error {
                    completion(nil, "Error: \(error.localizedDescription)")
                }
            } else {
                completion(nil, "Error: \(message ?? "No response")")
                print("Error: \(message ?? "No response")")
            }
        }
    }
}
