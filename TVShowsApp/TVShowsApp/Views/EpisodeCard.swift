//
//  EpisodeCard.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct EpisodeCard: View {

    var episode: Episode

    var body: some View {
        VStack {
            if let image = episode.image {
                AsyncImage(url: URL(string: image.medium)) { image in
                    image
                        .resizable()
                        .cornerRadius(6)
                        .scaledToFit()
                        .frame(width: 260,
                               height: 130,
                               alignment: .center)
                } placeholder: {
                    LoadingView()
                        .frame(width: 260,
                               height: 130,
                               alignment: .center)
                        .background(Gray.lightGray)
                        .cornerRadius(16)
                }
            } else {
                Text("No\nImage")
                    .frame(width: 230,
                           height: 130,
                           alignment: .center)
                    .multilineTextAlignment(.center)
                    .background(Gray.lightGray)
                    .cornerRadius(16)
            }

            Text("EPISODE \(episode.number)")
                .frame(width: 230,
                       alignment: .leading)
                .font(.system(size: 8,
                              weight: .medium,
                              design: .default))

                .foregroundColor(Gray.silver)

            Text(episode.name)
                .frame(width: 230,
                       alignment: .leading)
                .font(.system(size: 12,
                              weight: .medium,
                              design: .default))
            SummaryText(summary: episode.summary)
                .ignoresSafeArea()
                .font(.system(size: 10,
                              weight: .thin,
                              design: .default))
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(4)
            Spacer()
        }
        .frame(width: 260,
               height: 225,
               alignment: .leading)
        .accessibilityLabel("EpisodeCard\(episode.id)")
    }
}

struct EpisodeCard_Previews: PreviewProvider {
    static let episode1 = Episode(id: 0,
                                  name: "Episode name",
                                  number: 1,
                                  season: 1,
                                  summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", image: Poster(
                                    medium: "https://static.tvmaze.com/uploads/images/medium_landscape/358/896102.jpg",
                                    original: "https://static.tvmaze.com/uploads/images/medium_landscape/358/896102.jpg"
                                  ))

    static let episode2 = Episode(id: 0,
                                  name: "Episode name",
                                  number: 1,
                                  season: 1,
                                  summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  image: nil)

    static var previews: some View {
        EpisodeCard(episode: episode1)
        EpisodeCard(episode: episode2)
    }
}
