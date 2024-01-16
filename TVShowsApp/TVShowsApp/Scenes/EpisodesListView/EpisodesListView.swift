//
//  EpisodesListView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct EpisodesListView: View {
    // MARK: - Stored Properties
    @ObservedObject var viewModel: EpisodesListViewModel

    // MARK: - Views
    var body: some View {
        VStack {
            if viewModel.isFetching {
                LoadingView()
            } else {
                EpisodeCollection(episodesDictionary: $viewModel.episodeDictionary)
            }
        }
        .onAppear {
            viewModel.getEpisodes()
        }
    }
}

struct EpisodesListView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesListView(viewModel: EpisodesListViewModel(tvShowId: 58759))
    }
}
