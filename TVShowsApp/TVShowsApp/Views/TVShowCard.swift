//
//  TVShowCard.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct TVShowCard: View {

    // MARK: - Properties
    @Binding var show: TVShow

    // MARK: - Views
    var body: some View {
        HStack {
            if let image = show.image {
                AsyncImage(url: URL(string: image.medium)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    } placeholder: {
                        LoadingView()
                            .frame(width: 100, height: 100)
                    }
            } else {
                Text("No\nImage")
                    .multilineTextAlignment(.center)
                    .frame(width: 75,
                           height: 100,
                           alignment: .center)
                    .background(Gray.lightGray)
                    .padding()
            }

            Text(show.name)
                .bold()
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))

            Spacer()
        }
        .frame(height: 116)
        .accessibilityLabel("TVShowCard\(show.id)")
    }
}

struct TVShowCard_Previews: PreviewProvider {

    @State static var sampleShow = TVShow(id: 0,
                                          name: "The Daily Show with Jon Stewart",
                                          image: nil,
                                          schedule: Schedule(time: "", days: []),
                                          genres: [],
                                          summary: "")

    static var previews: some View {
        TVShowCard(show: $sampleShow)
    }
}
