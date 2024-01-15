//
//  TVShowsCoordinator.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import Foundation

class TVShowsCoordinator: ObservableObject {

    // MARK: - Stored Properties
    @Published var tvShowsListViewModel: TVShowsViewModel!

    private unowned let parent: MainCoordinator

    // MARK: - Initialization
    init(parent: MainCoordinator) {
        self.parent = parent
        self.tvShowsListViewModel = TVShowsViewModel(coordinator: self)
    }
}
