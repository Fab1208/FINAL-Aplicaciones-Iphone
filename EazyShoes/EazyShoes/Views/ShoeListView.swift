//
//  ShoeGridVIew.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import SwiftUI

struct ShoeListView: View {
    
    @ObservedObject var viewModel: ShoeListViewModel
    
    var body: some View {
        
        let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible())
        ]
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.shoes) { shoe in
                    ShoeListItemView(shoe: shoe)
                }
            }
        }.onAppear {
            viewModel.getShoes()
        }
    }
}

#Preview {
    ShoeListView(viewModel: ShoeListViewModel())
}
