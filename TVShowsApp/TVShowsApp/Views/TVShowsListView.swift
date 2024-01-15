//
//  TVShowsListView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct TVShowsListView: View {
    @Binding var tvShowList: [TVShow]
    var fetchMoreTVShow: (() -> Void)?

    var body: some View {
        VStack {
            List {
                if let fetchMoreTVShow = fetchMoreTVShow {
                    ForEach($tvShowList, id: \.id) { tvShow in
                        NavigationLink {
                            DetailShowView(tvShow: tvShow)
                        } label: {
                            TVShowCard(show: tvShow)
                                .onAppear {
                                    if tvShow.wrappedValue.id == tvShowList.last?.id {
                                        fetchMoreTVShow()
                                    }
                                }
                        }
                    }
                }
            }
            .overlay(alignment: Alignment.center) {
                if tvShowList.isEmpty {
                    Text("No TV Show found...")
                        .font(.title)
                        .foregroundColor(Gray.darkGray)
                        .frame(alignment: .center)
                }
            }
        }
    }
}

struct TVShowsListView_Previews: PreviewProvider {
    @State static var mockedTvShows = [
        TVShow(id: 0,
               name: "The Daily Show with Jon Stewart",
               image: nil,
               schedule: Schedule(time: "", days: []),
               genres: [], summary: ""),
        TVShow(id: 1,
               name: "How I Met Your Mother",
               image: nil,
               schedule: Schedule(time: "", days: []),
               genres: [], summary: "")
    ]

    static var previews: some View {
        TVShowsListView(tvShowList: $mockedTvShows)
    }
}
