//
//  SummaryText.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct SummaryText: View {

    @State var summary: String?

    var body: some View {
        if let summary = summary {
            if summary.withoutHtmlTags == "" {
                Text("No summary")
                    .italic()
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
                    .padding([.leading, .trailing])
            } else {
                Text(summary.withoutHtmlTags)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
                    .padding([.leading, .trailing])
            }
        } else {
            Text("No summary")
                .italic()
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .padding([.leading, .trailing])
        }
    }
}

struct SummaryText_Previews: PreviewProvider {
    static var previews: some View {
        SummaryText()
    }
}
