//
//  LocalDatabaseServiceProtocol.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 16/01/24.
//

import Foundation

protocol LocalDatabaseServiceProtocol {

    func getFavoriteList() -> [TVShow]

    func add(_ tvShow: TVShow) -> Bool

    func removeTVShow(by tvShowId: Int) -> Bool
}
