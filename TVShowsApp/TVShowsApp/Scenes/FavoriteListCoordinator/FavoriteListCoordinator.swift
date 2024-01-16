//
//  FavoriteListCoordinator.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import Foundation

class FavoriteListCoordinator: ObservableObject {

    // MARK: - Stored Properties
    private unowned let parent: MainCoordinator

    // MARK: - Initialization
    init(parent: MainCoordinator) {
        self.parent = parent
    }
}
