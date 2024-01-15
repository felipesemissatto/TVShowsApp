//
//  TVShowsViewModel.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import Foundation

class TVShowsViewModel: ObservableObject {

    // MARK: - Stored Properties
    private unowned let coordinator: TVShowsCoordinator

    // MARK: - Initialization
    init(coordinator: TVShowsCoordinator) {
        self.coordinator = coordinator
    }
}
