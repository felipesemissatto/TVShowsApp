//
//  DetailTVShowView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct DetailShowView: View {

    @Binding var tvShow: TVShow

    var body: some View {
        ScrollView {
            VStack {
                if let image = tvShow.image {
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
                            .frame(height: 200)
                    }
                    .shadow(color: Color.black.opacity(0.5),
                            radius: 6)
                } else {
                    Text("No\nImage")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity,
                               minHeight: 200,
                               idealHeight: 200,
                               maxHeight: 200,
                               alignment: .center)
                        .background(Gray.lightGray)
                }

                Text(subtitleString(from: tvShow))
                    .font(.system(size: 12,
                                  weight: .light,
                                  design: .default))
                    .foregroundColor(Gray.darkGray)
            }
            .padding()

            SummaryText(summary: tvShow.summary)
        }
        .navigationTitle(tvShow.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Methods
    private func subtitleString(from show: TVShow) -> String {
        var subtitleString = ""

        if !show.genres.isEmpty {
            subtitleString = show.genres.joined(separator: ", ")
        }

        if show.schedule.time != "" {
            if !show.genres.isEmpty {
                subtitleString.append(" · ")
            }
            subtitleString.append("\(show.schedule.time)H")
        }

        if !show.schedule.days.isEmpty {
            if !show.genres.isEmpty || show.schedule.time != "" {
                subtitleString.append(" · ")
            }
            subtitleString.append(show.schedule.days.joined(separator: ", "))
        }

        return subtitleString
    }
}

struct DetailShowView_Previews: PreviewProvider {
    @State static var sampleShow = TVShow(id: 0,
                                          name: "The Daily Show with Jon Stewart",
                                          image: nil,
                                          schedule: Schedule(time: "", days: []),
                                          genres: [],
                                          summary: "")

    static var previews: some View {
        DetailShowView(tvShow: $sampleShow)
    }
}
