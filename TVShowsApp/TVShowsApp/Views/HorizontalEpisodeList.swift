//
//  HorizontalEpisodeList.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct HorizontalEpisodeList: View {

    var episodes: [Episode]
    let rows = [
        GridItem(.fixed(225))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(episodes, id: \.self) { episode in
                    NavigationLink {
                        DetailEpisodeView(episode: episode)
                    } label: {
                        EpisodeCard(episode: episode)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(height: 225)
        }
    }
}

struct HorizontalEpisodeList_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalEpisodeList(episodes: [Episode(id: 0,
                                                 name: "Episode name",
                                                 number: 1,
                                                 season: 1,
                                                 summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                                 image: Poster(
                                                    medium: "",
                                                    original: ""
                                                 ))])
    }
}
