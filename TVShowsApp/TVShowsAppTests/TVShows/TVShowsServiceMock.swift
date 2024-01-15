//
//  TVShowsServiceMock.swift
//  TVShowsAppTests
//
//  Created by Felipe Semissatto on 14/01/24.
//

import Foundation
@testable import TVShowsApp

class TVShowsServiceMock: TVShowsServiceProtocol {
    var mockData: Data?

    func getShows(onPage page: Int, completion: @escaping (Result<[TVShow], ApiServiceErrors>) -> Void) {

        guard let mockData = self.mockData else {
            completion(.failure(.noDataFound))
            return
        }

        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([TVShow].self, from: mockData)
            completion(.success(decoded))
        } catch {
            completion(.failure(.failedToDecode))
        }
    }

    func searchTVShow(by name: String, completion: @escaping (Result<[RankedShow], ApiServiceErrors>) -> Void) {
        guard let mockData = self.mockData else {
            completion(.failure(.noDataFound))
            return
        }

        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([RankedShow].self, from: mockData)
            completion(.success(decoded))
        } catch {
            completion(.failure(.failedToDecode))
        }
    }
}
