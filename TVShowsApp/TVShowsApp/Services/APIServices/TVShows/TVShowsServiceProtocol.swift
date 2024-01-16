//
//  TVShowsServiceProtocol.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

protocol TVShowsServiceProtocol {

    /// Get paginated TV shows based on the current page.
    ///
    /// - Parameters:
    ///   - page: The current page to search for.
    ///   - completion: Response from the API.
    func getShows(onPage page: Int, completion: @escaping (Result<[TVShow], ApiServiceErrors>) -> Void)

    /// Get TV shows by their name.
    ///
    /// - Parameters:
    ///   - name: TV show's name to search for.
    ///   - completion: Response from the API.
    func searchTVShow(by name: String, completion: @escaping (Result<[RankedShow], ApiServiceErrors>) -> Void)
}
