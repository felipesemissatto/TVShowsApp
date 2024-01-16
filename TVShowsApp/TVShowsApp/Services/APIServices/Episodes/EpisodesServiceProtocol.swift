//
//  EpisodesServiceProtocol.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import Foundation

protocol EpisodesServiceProtocol {

    /// Get a list of episodes by the TV show id.
    ///
    /// - Parameters:
    ///   - tvShowId: The TV show id to search for.
    ///   - completion: Response from the API.
    func getEpisodes(by tvShowId: Int, completion: @escaping (Result<[Episode], ApiServiceErrors>) -> Void)
}
