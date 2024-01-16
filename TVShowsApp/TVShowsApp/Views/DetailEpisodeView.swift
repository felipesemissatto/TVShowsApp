//
//  DetailEpisodeView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct DetailEpisodeView: View {
    var episode: Episode

    var body: some View {
        ScrollView {
            VStack {
                if let image = episode.image {
                    AsyncImage(url: URL(string: image.original)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity,
                                   minHeight: 200,
                                   idealHeight: 200,
                                   maxHeight: 200,
                                   alignment: .center)
                    } placeholder: {
                        LoadingView()
                            .frame(maxWidth: .infinity,
                                   minHeight: 200,
                                   idealHeight: 200,
                                   maxHeight: 200,
                                   alignment: .center)
                            .background(Gray.lightGray)
                            .cornerRadius(16)
                    }
                    .shadow(color: Color.black.opacity(0.5),
                            radius: 6)
                } else {
                    Text("No\nImage")
                        .frame(maxWidth: .infinity,
                               minHeight: 200,
                               idealHeight: 200,
                               maxHeight: 200,
                               alignment: .center)
                        .multilineTextAlignment(.center)
                        .background(Gray.lightGray)
                        .cornerRadius(16)
                }
            }
            .padding()
            VStack {
                Text(episode.name)
                    .font(.title)
                    .bold()
                Text("Season \(episode.season) · Episode \(episode.number)")
                    .font(.system(size: 12,
                                  weight: .light,
                                  design: .default))
                    .foregroundColor(Gray.darkGray)
            }
            .padding()

            SummaryText(summary: episode.summary)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailEpisodeView_Previews: PreviewProvider {
    static let episode1 = Episode(id: 0, name: "Episode name",
                                  number: 1,
                                  season: 1,
                                  summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  image: Poster(
                                    medium: "https://static.tvmaze.com/uploads/images/medium_landscape/358/896102.jpg",
                                    original: ""
                                  ))

    static var previews: some View {
        DetailEpisodeView(episode: episode1)
    }
}
