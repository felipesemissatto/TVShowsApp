//
//  TVShowsServiceProtocol.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

protocol ShowsServiceProtocol {
    func getShows(onPage page: Int, completion: @escaping (Result<[TVShow], Error>) -> Void)
}
