//
//  EpisodeCollection.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct EpisodeCollection: View {

    @Binding var episodesDictionary: [Int: [Episode]]

    var body: some View {
        LazyVStack {
            ForEach(episodesDictionary.keys.sorted(), id: \.self) { key in
                Section(header: SectionView(text: "Season \(key)")) {
                    if let episodes = episodesDictionary[key] {
                        HorizontalEpisodeList(episodes: episodes)
                    }
                }
            }
        }
    }
}

struct EpisodeCollection_Previews: PreviewProvider {
    @State static var episodesDictionary = [
        0: [Episode(id: 0,
                   name: "Episode name",
                   number: 1,
                   season: 1,
                   summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", image: Poster(
                     medium: "https://static.tvmaze.com/uploads/images/medium_landscape/358/896102.jpg",
                     original: "https://static.tvmaze.com/uploads/images/medium_landscape/358/896102.jpg"
                   ))],
        1: [Episode(id: 0,
                   name: "Episode name",
                   number: 1,
                   season: 1,
                   summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", image: Poster(
                     medium: "https://static.tvmaze.com/uploads/images/medium_landscape/358/896102.jpg",
                     original: "https://static.tvmaze.com/uploads/images/medium_landscape/358/896102.jpg"
                   ))]
    ]

    static var previews: some View {
        EpisodeCollection(episodesDictionary: $episodesDictionary)
    }
}
