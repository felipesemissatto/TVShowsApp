//
//  SearchingView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct SearchingView: View {

    var feedbackMessage: String = "Searching..."

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .opacity(0.25)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            LoadingView(feedbackMessage: feedbackMessage)
                .padding()
                .background()
                .cornerRadius(6)
        }
    }
}

struct SearchingView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingView()
    }
}
