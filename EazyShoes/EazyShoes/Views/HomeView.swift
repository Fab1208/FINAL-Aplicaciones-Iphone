//
//  HomeView.swift
//  EazyShoes
//
//  Created by Alumno on 16/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = ShoeListViewModel()
    
    var body: some View {
        TabView {
            ShoesView().tabItem {
                Label("Shoes", systemImage: "shoe")
            }
            FavoriteListView().tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
        }.accentColor(Color.orange)
    }
}

#Preview {
    HomeView()
}
