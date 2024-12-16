//
//  ShoesView.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import SwiftUI

struct ShoesView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    let categories = ["Women", "Men", "Kids"]
    
    @StateObject var viewModel = ShoeListViewModel()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea(.all)
                VStack {
                    ScrollView (.horizontal) {
                        HStack (spacing: 25) {
                            ForEach(categories, id: \.self) { category in
                                Text(category).padding(.top, 7)
                                    .padding(.bottom, 7)
                                    .padding(.horizontal, 30)
                                    .foregroundColor(viewModel.selectedCategory == category ? Color.orange : Color.gray)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(viewModel.selectedCategory == category ? Color.orange : Color.clear, lineWidth: 2)
                                        )
                                    .onTapGesture {
                                        viewModel.updateCategory(category: category)
                                    }
                            }
                        }
                    }.padding()
                    
                    ShoeListView(viewModel: viewModel)
                    Spacer()
                    
                }.navigationTitle("EazyShoes")
            }
        }
    }
}

#Preview {
    ShoesView()
}
