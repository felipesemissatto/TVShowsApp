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
            TVShowsListView(tvShowList: $viewModel.paginatedTVShowList,
                            fetchMoreTVShow: { viewModel.fetchMoreTVShow() })
            .overlay(alignment: .center) {
                if viewModel.isFetching {
                    SearchingView(feedbackMessage: "Loading TV shows...")
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
