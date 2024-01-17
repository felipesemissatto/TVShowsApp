//
//  FavoriteListView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 16/01/24.
//

import SwiftUI

struct FavoriteListView: View {
    // MARK: - Stored Properties
    @ObservedObject var viewModel: FavoriteListViewModel

    // MARK: - Views
    var body: some View {
        TVShowsListView(tvShowList: $viewModel.favoriteList,
                        deleteTVShow: { showId in
            viewModel.deleteTVShow(by: showId)
        })
        .onAppear {
            viewModel.getFavoriteList()
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    @State static var viewModel = FavoriteListViewModel(coordinator: FavoriteListCoordinator(parent: MainCoordinator()))

    static var previews: some View {
        FavoriteListView(viewModel: viewModel)
    }
}
