//
//  LoadingView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct LoadingView: View {
    var feedbackMessage: String = "Loading..."
    var isVertical: Bool = true

    var body: some View {
        if isVertical {
            VStack {
                ProgressView()
                    .padding([.bottom], 12)
                Text(feedbackMessage)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .frame(height: 30)
            }
        } else {
            HStack {
                ProgressView()
                    .padding([.bottom], 12)
                Text(feedbackMessage)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .frame(height: 30)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
