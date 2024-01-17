//
//  TVShowsViewModel.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import Foundation

class TVShowsViewModel: ObservableObject {

    // MARK: - Published Properties
    @Published var paginatedTVShows: [TVShow] = []
    @Published var searchedTVShows: [TVShow] = []

    @Published var isFetching: Bool = false
    @Published var typedText: String = ""
    @Published var isSearching: Bool = false

    // MARK: Public Properties
    var currentPage: Int = 0

    // MARK: Private Properties
    private unowned let coordinator: TVShowsCoordinator
    private let service: TVShowsServiceProtocol!

    // MARK: - Initialization
    init(coordinator: TVShowsCoordinator,
         service: TVShowsServiceProtocol = TVShowsService()) {
        self.coordinator = coordinator
        self.service = service
    }

    // MARK: - Methods

    /// Get paginated TV shows from the API.
    ///
    /// - Parameter page: The current page to search for.
    func getTVShows(onPage page: Int) {
        self.isFetching = true
        self.service.getShows(onPage: page) { result in
            switch result {
            case .success(let shows):
                DispatchQueue.main.async {
                    self.paginatedTVShows = shows
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

    /// Get TV shows for the next page.
    func fetchMoreTVShow() {
        self.currentPage += 1
        self.isFetching = true
        self.service.getShows(onPage: self.currentPage) { result in
            switch result {
            case .success(let tvShows):
                DispatchQueue.main.async {
                    self.paginatedTVShows += tvShows
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

    /// Get TV shows by their name.
    func searchShowByName() {
        self.isSearching = true
        self.service.searchTVShow(by: typedText) { result in
            switch result {
            case .success(let rankedShows):
                DispatchQueue.main.async {
                    let shows: [TVShow] = rankedShows.map { rankedShow in
                        return rankedShow.show
                    }
                    self.searchedTVShows = shows
                    self.isSearching = false
                }
            case .failure(let error):
                // TODO: Show an error alert
                DispatchQueue.main.async {
                    self.isSearching = false
                }
                print(error)
            }

        }
    }
}
