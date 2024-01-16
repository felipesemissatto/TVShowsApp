//
//  EpisodesListViewModel.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import Foundation

class EpisodesListViewModel: ObservableObject {

    // MARK: - Stored Properties
    @Published var episodeDictionary: [Int: [Episode]] = [:]
    @Published var isFetching: Bool = false

    private let service: EpisodesServiceProtocol!
    private let tvShowId: Int

    // MARK: - Initialization
    init(tvShowId: Int,
         service: EpisodesServiceProtocol = EpisodesService()) {
        self.service = service
        self.tvShowId = tvShowId
    }

    // MARK: - Methods

    /// Load episodes from the API based on TV show id.
    func getEpisodes() {
        self.isFetching = true
        self.service.getEpisodes(by: self.tvShowId) { result in
            switch result {
            case .success(let episodes):
                DispatchQueue.main.async {
                    self.episodeDictionary = self.makeDictionary(from: episodes)
                    self.isFetching = false
                }
            case .failure(let error):
                // TODO: Show an error alert
                DispatchQueue.main.async {
                    self.isFetching = false
                }
                print(error)
            }
        }
    }

    // MARK: - Private Methods

    /// Create a dicitionary for the episodes.
    /// Example:  [0: [Episode 1, Episode 2]].
    ///
    /// - Parameter episodeArray: List of episodes.
    /// - Returns: A dictionary, where the keys are the season number and the values are the related episodes.
    private func makeDictionary(from episodeArray: [Episode]) -> [Int: [Episode]] {
        let seasons = Array(Set(episodeArray.map { $0.season }))
        let tuples = seasons.map { season -> (Int, [Episode]) in
            let episodes = episodeArray.filter { episode in
                episode.season == season
            }
            return (season, episodes)
        }

        return Dictionary(uniqueKeysWithValues: tuples)
    }
}
