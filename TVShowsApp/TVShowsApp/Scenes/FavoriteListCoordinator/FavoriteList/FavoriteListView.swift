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
        TVShowsListView(tvShowList: $viewModel.favoriteList)
    }
}
