//
//  EpisodesServiceMock.swift
//  TVShowsAppTests
//
//  Created by Felipe Semissatto on 15/01/24.
//

import Foundation
@testable import TVShowsApp

class EpisodesServiceMock: EpisodesServiceProtocol {
    var mockData: Data?

    func getEpisodes(by showId: Int, completion: @escaping (Result<[Episode], ApiServiceErrors>) -> Void) {
        guard let mockData = self.mockData else {
            completion(.failure(.noDataFound))
            return
        }

        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([Episode].self, from: mockData)
            completion(.success(decoded))
        } catch {
            completion(.failure(.failedToDecode))
        }
    }
}
