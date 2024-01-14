//
//  TVShow.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

struct TVShow: Codable {
    let id: Int
    let name: String
    let image: Poster?
    let schedule: Schedule
    let genres: [String]
    let summary: String?
}

struct Poster: Codable {
    let medium: String
    let original: String
}

struct Schedule: Codable {
    let time: String
    let days: [String]
}
