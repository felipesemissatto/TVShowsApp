//
//  Endpoints.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

public struct Endpoints {
    public static let rootUrl = "https://api.tvmaze.com"
    public static let showIndex = rootUrl+"/shows?page="
    public static let showSearch = rootUrl+"/search/shows?q="
}
