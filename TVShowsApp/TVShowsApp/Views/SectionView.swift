//
//  SectionView.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct SectionView: View {
    var text: String
    var body: some View {
        HStack {
            Text(text)
                .bold()
                .padding([.leading, .trailing], 16)
                .background(Gray.lightGray)
                .cornerRadius(6)
            Spacer()
        }
        .padding([.leading], 12)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(text: "Season 13")
    }
}
