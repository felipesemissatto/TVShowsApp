//
//  EpisodesService.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import Foundation

class EpisodesService: EpisodesServiceProtocol {
    func getEpisodes(by tvShowId: Int, completion: @escaping (Result<[Episode], ApiServiceErrors>) -> Void) {
        guard let url = URL(string: Endpoints.rootUrl+"/shows/\(tvShowId)/episodes") else {
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
                let decoded = try decoder.decode([Episode].self, from: jsonData)
                completion(.success(decoded))
            } catch {
                completion(.failure(.failedToDecode))
            }
        }
        task.resume()
    }
}
