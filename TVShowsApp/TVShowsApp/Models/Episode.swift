//
//  Episode.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 15/01/24.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let number: Int
    let season: Int
    let summary: String?
    let image: Poster?
}

extension Episode: Hashable {

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }

    public static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.id == rhs.id
    }
}
