//
//  FavoriteButton.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 16/01/24.
//

import SwiftUI

struct FavoriteButton: View {
    @State var isFavorited: Bool = false
    var addTVShowToFavoriteList: (() -> Void)?
    var deleteTVShowToFavoriteList: (() -> Void)?

    var body: some View {
        Button(action: {
            if isFavorited {
                if let deleteTVShowToFavoriteList {
                    deleteTVShowToFavoriteList()
                }
            } else {
                if let addTVShowToFavoriteList {
                    addTVShowToFavoriteList()
                }
            }
            self.isFavorited.toggle()
        }) {
            if self.isFavorited {
                Image(systemName: "star.fill")
                    .renderingMode(.original)
            } else {
                Image(systemName: "star")
                    .renderingMode(.original)
            }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(addTVShowToFavoriteList: { print("Did add!") },
                       deleteTVShowToFavoriteList: { print("Did delete!") })
    }
}
