//
//  LocalDatabaseService.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 16/01/24.
//

import Foundation
import CoreData

class LocalDatabaseService: LocalDatabaseServiceProtocol {
    func getFavoriteList() -> [TVShow] {
        []
    }

    func add(_ tvShow: TVShow) -> Bool {
        false
    }

    func removeTVShow(by tvShowId: Int) -> Bool {
        false
    }
}
