//
//  FavoriteListView.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import SwiftUI

struct FavoriteListView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    @StateObject var viewModel = FavoriteListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea(.all)
                VStack {
                    List {
                        ForEach(viewModel.favorites, id: \.self) { favorite in
                            HStack {
                                AsyncImage(
                                    url: URL(string: favorite.image ?? ""),
                                    content: { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 60)
                                    },
                                    placeholder: {
                                        ProgressView()
                                            .frame(width: 80, height: 60)
                                    }
                                )
                                VStack (alignment: .leading) {
                                    Text("$\(favorite.price)")
                                        .foregroundColor(.white)
                                        .padding(.top, 2)
                                        .padding(.bottom, 2)
                                        .padding(.horizontal, 10)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.orange, lineWidth: 2))
                                        .background(Color.orange)
                                    
                                    Text(favorite.name ?? "").listRowBackground(Color.black)
                                        .foregroundStyle(.white)
                                        .bold()
                                        .lineLimit(1)
                                    
                                    Text(favorite.gender ?? "")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                    
                                    Text(favorite.brand ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }.listRowBackground(Color.black)
                        }.onDelete(perform: { indexSet in
                            viewModel.removeFavorite(indexSet: indexSet)
                        })
                    }.onAppear {
                        viewModel.getFavorites()
                    }.listStyle(.plain)
                }.padding()
                    .navigationTitle("Favorites")
            }
        }
    }
}

#Preview {
    FavoriteListView()
}
