//
//  FavoriteListCoordinatorView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct FavoriteListCoordinatorView: View {
    // MARK: - Stored Properties
    @ObservedObject var favoriteListCoordinator: FavoriteListCoordinator

    // MARK: - Views
    var body: some View {
        NavigationView {
            FavoriteListView(viewModel: favoriteListCoordinator.favoriteListViewModel)
                .navigationTitle("Favorite List")
        }
    }
}
