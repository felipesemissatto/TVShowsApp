//
//  MainCoordinatorView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import SwiftUI

struct MainCoordinatorView: View {

    // MARK: - Stored Properties
    @ObservedObject var mainCoordinator: MainCoordinator

    // MARK: - Views
    var body: some View {
        TabView(selection: $mainCoordinator.appState) {
            TVShowsCoordinatorView(tvShowsCoordinator: mainCoordinator.tvShowsCoordinator)
                .tabItem {
                    Label("TV Shows", systemImage: "list.and.film")
                }
                .tag(AppState.tvShowList)

            FavoriteListCoordinatorView(object: mainCoordinator.favoriteListCoordinator)
                .tabItem {
                    Label("Favorite List", systemImage: "star.fill")
                }
                .tag(AppState.favoriteTvShowList)
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}
