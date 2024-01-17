//
//  DetailTVShowViewModel.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 16/01/24.
//

import Foundation

class DetailTVShowViewModel: ObservableObject {

    // MARK: - Stored Properties
    @Published var tvShow: TVShow

    private let databaseService: LocalDatabaseServiceProtocol!

    // MARK: - Initialization
    init(tvShow: TVShow,
         databaseService: LocalDatabaseServiceProtocol = LocalDatabaseService.shared) {
        self.tvShow = tvShow
        self.databaseService = databaseService
    }

    // MARK: - Methods

    /// Remove the current TV show from favorite list.
    func deleteTVShowToFavoriteList() {
        databaseService.removeTVShow(by: tvShow.id)
    }

    /// Add the current TV show from favorite list.
    func addTVShowToFavoriteList() {
        databaseService.add(tvShow)
    }

    /// Check if a TV show is favorited.
    ///
    /// - Returns: True if it is favorited. Otherwise, false.
    func isTVShowFavorited() -> Bool {
        return databaseService.isTVShowOnFavoriteList(tvShowId: tvShow.id)
    }
}
