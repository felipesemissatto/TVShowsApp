//
//  SearchBar.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import SwiftUI

struct SearchBar: View {

    @Binding var typedText: String
    var didType: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Gray.darkGray)
                .padding([.top, .bottom, .leading])
            TextField("Search", text: $typedText)
                .padding([.top, .bottom, .trailing])
                .onChange(of: typedText) { _ in
                    didType()
                }
        }
        .background(Gray.lightGray)
        .frame(maxWidth: .infinity,
               minHeight: 28,
               idealHeight: 28,
               maxHeight: 28)
        .cornerRadius(6)
        .padding([.leading, .trailing])
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(typedText: .constant("the"), didType: { print("Did type!")})
    }
}
