//
//  TVShowsService.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import Foundation

class TVShowsService: TVShowsServiceProtocol {
    func getShows(onPage page: Int, completion: @escaping (Result<[TVShow], ApiServiceErrors>) -> Void) {
        guard let url = URL(string: Endpoints.showIndex+"\(page)") else {
            completion(.failure(.invalidUrl))
            return
        }

        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, _) in
            guard let jsonData = data else {
                completion(.failure(.noDataFound))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([TVShow].self, from: jsonData)
                completion(.success(decoded))
            } catch {
                completion(.failure(.failedToDecode))
            }
        }
        task.resume()
    }

    func searchShow(by name: String, completion: @escaping (Result<[RankedShow], ApiServiceErrors>) -> Void) {
        completion(.failure(.failedToDecode))
    }
}
