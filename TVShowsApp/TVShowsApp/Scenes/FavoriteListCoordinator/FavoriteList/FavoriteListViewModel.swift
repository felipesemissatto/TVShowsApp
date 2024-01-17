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
         service: LocalDatabaseServiceProtocol = LocalDatabaseService()) {
        self.coordinator = coordinator
        self.service = service
    }

    // MARK: - Methods

    func getFavoriteList() {
        favoriteList = service.getFavoriteList()
    }

    func deleteShow(by showId: Int) {
        service.removeTVShow(by: showId)
        getFavoriteList()
    }

    func add(_ tvShow: TVShow) {
        service.add(tvShow)
        getFavoriteList()
    }
}
