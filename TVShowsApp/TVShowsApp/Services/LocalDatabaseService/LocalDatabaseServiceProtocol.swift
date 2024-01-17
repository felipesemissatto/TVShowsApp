//
//  LocalDatabaseServiceProtocol.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 16/01/24.
//

import Foundation

protocol LocalDatabaseServiceProtocol {

    /// Load data from the container.
    func loadData()

    /// Get a list of favorite TV shows.
    ///
    /// - Parameter tvShowId: TV Show identifier.
    /// - Returns: A list of TV shows
    func getFavoriteList() -> [TVShow]

    /// Store a TV show locally.
    ///
    /// - Parameter tvShow: TV show to be stored.
    func add(_ tvShow: TVShow)

    /// Delete a TV show locally.
    ///
    /// - Parameter tvShowId: TV Show identifier.
    func removeTVShow(by tvShowId: Int)

    /// Check if a TV show is favorited.
    ///
    /// - Parameter tvShowId: TV Show identifier.
    /// - Returns: True if it is favorited. Otherwise, returns false.
    func isTVShowOnFavoriteList(tvShowId: Int) -> Bool
}
