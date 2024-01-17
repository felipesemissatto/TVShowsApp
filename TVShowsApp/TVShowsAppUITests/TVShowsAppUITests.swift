//
//  TVShowsAppUITests.swift
//  TVShowsAppUITests
//
//  Created by Felipe Semissatto on 14/01/24.
//

import XCTest
// swiftlint:disable line_length
final class TVShowsAppUITests: XCTestCase {

    // MARK: - Tests Lifecycle
    override func setUpWithError() throws {
        continueAfterFailure = false

    }

    // MARK: - Tests

    func testFavoritingTwoTVShows() throws {
        // Open app
        let app = XCUIApplication()
        app.launch()
        sleep(2)

        // Favoriting the first one
        app.collectionViews.buttons["TVShowCard1"].tap()
        app.scrollViews.otherElements.scrollViews.otherElements.buttons["EpisodeCard1, EpisodeCard1, EpisodeCard1"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Under the Dome"].tap()

        app.navigationBars["Under the Dome"]/*@START_MENU_TOKEN@*/.buttons["FavoriteButton"]/*[[".otherElements[\"FavoriteButton\"].buttons[\"FavoriteButton\"]",".buttons[\"FavoriteButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Under the Dome"].buttons["TV Shows"].tap()

        // Favoriting the second one
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["TVShowCard2"]/*[[".cells.buttons[\"TVShowCard2\"]",".buttons[\"TVShowCard2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Person of Interest"]/*@START_MENU_TOKEN@*/.buttons["FavoriteButton"]/*[[".otherElements[\"FavoriteButton\"].buttons[\"FavoriteButton\"]",".buttons[\"FavoriteButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Person of Interest"].buttons["TV Shows"].tap()
    }

}
// swiftlint:enable line_length
