//
//  TVShowsApp.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 14/01/24.
//

import SwiftUI

@main
struct TVShowsApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinatorView(mainCoordinator: MainCoordinator())
        }
    }
}
