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
    private let service: LocalDatabaseServiceProtocol!

    // MARK: - Initialization
    init(coordinator: FavoriteListCoordinator,
         service: LocalDatabaseServiceProtocol = LocalDatabaseService.shared) {
        self.coordinator = coordinator
        self.service = service
    }

    // MARK: - Methods

    /// Return a list of favorite TV shows in alphabetical order.
    func getFavoriteList() {
        favoriteList = service.getFavoriteList().sorted(by: {$0.name < $1.name})
    }

    /// Remove TV show from local storage.
    ///
    /// - Parameter showId: TV show identifier.
    func deleteTVShow(by showId: Int) {
        service.removeTVShow(by: showId)
        getFavoriteList()
    }
}
