//
//  TVShowsCoordinatorView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import SwiftUI

struct TVShowsCoordinatorView: View {
    // MARK: - Stored Properties
    @ObservedObject var tvShowsCoordinator: TVShowsCoordinator

    // MARK: - Views
    var body: some View {
        NavigationView {
            TVShowsView(viewModel: tvShowsCoordinator.tvShowsListViewModel)
                .navigationTitle("TV Shows")
        }
    }
}
