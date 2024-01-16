//
//  FavoriteListViewModel.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 16/01/24.
//

import Foundation

class FavoriteListViewModel: ObservableObject {

    // MARK: - Stored Properties
    @Published var favoriteList: [TVShow] = []

    private unowned let coordinator: FavoriteListCoordinator

    // MARK: - Initialization
    init(coordinator: FavoriteListCoordinator) {
        self.coordinator = coordinator
    }

}
