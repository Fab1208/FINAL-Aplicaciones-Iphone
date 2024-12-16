//
//  ShoeListItemView.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import SwiftUI

struct ShoeListItemView: View {
    
    @State var isFavorite: Bool = false
    let shoe: Shoe
    
    @StateObject var viewModel = ShoeListItemViewModel()
    
    var body: some View {
            ZStack (alignment: .topTrailing) {
                VStack {
                    AsyncImage(
                        url: URL(string: shoe.image),
                        content: { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 80)
                        },
                        placeholder: {
                            ProgressView()
                                .frame(width: 120, height: 80)
                        }
                    )
                    
                    VStack(alignment: .leading) {
                        Text("$\(shoe.price)")
                            .foregroundColor(.white)
                            .padding(.top, 2)
                            .padding(.bottom, 2)
                            .padding(.horizontal, 10)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.orange, lineWidth: 2))
                            .background(Color.orange)
                        Text(shoe.name)
                            .font(.headline).bold()
                            .foregroundStyle(.white)
                            .lineLimit(1)

                        Text(shoe.brand)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }

                Button(action: {
                    isFavorite.toggle()
                    isFavorite ? viewModel.insertFavorite(shoe: shoe) : viewModel.removeFavorite(shoe: shoe)
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(Color.orange)
                }.buttonStyle(BorderlessButtonStyle())
            }.padding()
            .background(Color.black)
        }
}
