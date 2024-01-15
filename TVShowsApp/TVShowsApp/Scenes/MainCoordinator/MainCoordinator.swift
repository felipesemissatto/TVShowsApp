//
//  MainCoordinator.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import Foundation

enum AppState {
    case tvShowList
    case favoriteTvShowList
}

class MainCoordinator: ObservableObject {

    // MARK: - Stored Properties
    @Published var appState: AppState = .tvShowList
    @Published var tvShowsCoordinator: TVShowsCoordinator!

    // MARK: - Initialization
    init() {
        self.tvShowsCoordinator = TVShowsCoordinator(parent: self)
    }
}
