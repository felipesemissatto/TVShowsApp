//
//  TVShowsServiceProtocol.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

protocol TVShowsServiceProtocol {
    func getShows(onPage page: Int, completion: @escaping (Result<[TVShow], ApiServiceErrors>) -> Void)
    func searchShow(by name: String, completion: @escaping (Result<[RankedShow], ApiServiceErrors>) -> Void)
}
