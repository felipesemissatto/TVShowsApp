//
//  MainCoordinator.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import Foundation
import UIKit

enum AppState {
    case tvShowList
    case favoriteTvShowList
}

class MainCoordinator: ObservableObject {

    // MARK: - Stored Properties
    @Published var appState: AppState = .tvShowList
    @Published var tvShowsCoordinator: TVShowsCoordinator!
    @Published var favoriteListCoordinator: FavoriteListCoordinator!

    // MARK: - Initialization
    init() {
        self.tvShowsCoordinator = TVShowsCoordinator(parent: self)
        self.favoriteListCoordinator = FavoriteListCoordinator(parent: self)
        self.setupTabView()
    }

    // MARK: - Private Methods

    /// Set a background for the `TabView`.
    private func setupTabView() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
