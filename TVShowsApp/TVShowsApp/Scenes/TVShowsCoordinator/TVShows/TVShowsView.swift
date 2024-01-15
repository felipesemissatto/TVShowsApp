//
//  TVShowsView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import SwiftUI

struct TVShowsView: View {
    // MARK: - Stored Properties
    @ObservedObject var viewModel: TVShowsViewModel

    // MARK: - Views
    var body: some View {
        VStack {
            SearchBar(
                typedText: $viewModel.typedText,
                didType: {
                    viewModel.searchShowByName()
                }
            )

            TVShowsListView(
                tvShowList: viewModel.typedText.isEmpty ? $viewModel.paginatedTVShows : $viewModel.searchedTVShows,
                fetchMoreTVShow: {
                    viewModel.fetchMoreTVShow()
                })
            .overlay(alignment: .center) {
                if viewModel.isSearching || viewModel.isFetching {
                    SearchingView(
                        feedbackMessage: viewModel.isSearching ? "Searching TV show by name..." : "Loading TV shows..."
                    )
                }
            }
        }
        .onAppear {
            viewModel.getTVShows(onPage: viewModel.currentPage)
        }
    }
}

struct TVShowsView_Previews: PreviewProvider {
    @State static var viewModel = TVShowsViewModel(coordinator: TVShowsCoordinator(parent: MainCoordinator()))

    static var previews: some View {
        TVShowsView(viewModel: viewModel)
    }
}
