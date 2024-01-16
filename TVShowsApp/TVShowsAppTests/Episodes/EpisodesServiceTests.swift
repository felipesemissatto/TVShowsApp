//
//  EpisodesServiceTests.swift
//  TVShowsAppTests
//
//  Created by Felipe Semissatto on 15/01/24.
//

import XCTest
@testable import TVShowsApp

final class EpisodesServiceTests: XCTestCase {

    // MARK: - Subject Under Tests
    private var sut: EpisodesServiceMock!

    // MARK: - Setup
    override func setUpWithError() throws {
        self.sut = EpisodesServiceMock()
    }

    // MARK: - Teardown
    override func tearDownWithError() throws {
        self.sut = nil
    }

    // MARK: - Tests

    func testGetEpisodes_whenDataIsNil_ShouldThrowError() throws {
        // Given
        self.sut.mockData = nil
        var episodes: [Episode]?
        var error: ApiServiceErrors?

        // When
        self.sut.getEpisodes(by: 0) { result in
            switch result {
            case .success(let responseEpisodes):
                episodes = responseEpisodes
            case .failure(let responseError):
                error = responseError
            }
        }

        // Then
        XCTAssertNil(episodes)
        XCTAssertNotNil(error)
        XCTAssertEqual(error, .noDataFound)
    }

    func testGetEpisodes_whenDataIsValid_ShouldReturnEpisodeList() throws {
        // Given
        self.sut.mockData = validEpisodesData
        var episodes: [Episode]?
        var error: ApiServiceErrors?

        // When
        self.sut.getEpisodes(by: 0) { result in
            switch result {
            case .success(let responseEpisodes):
                episodes = responseEpisodes
            case .failure(let responseError):
                error = responseError
            }
        }

        // Then
        XCTAssertNil(error)
        XCTAssertNotNil(episodes)
        XCTAssertTrue(episodes?.count == 3)
    }

    func testGetEpisodes_whenDataIsInvalid_ShouldThrowError() throws {
        // Given
        self.sut.mockData = invalidEpisodesData
        var episodes: [Episode]?
        var error: ApiServiceErrors?

        // When
        self.sut.getEpisodes(by: 0) { result in
            switch result {
            case .success(let responseEpisodes):
                episodes = responseEpisodes
            case .failure(let responseError):
                error = responseError
            }
        }

        // Then
        XCTAssertNil(episodes)
        XCTAssertNotNil(error)
        XCTAssertEqual(error, .failedToDecode)
    }
}

// MARK: - Mocked Episodes Data

extension EpisodesServiceTests {
    var validEpisodesData: Data? {
            """
            [
              {
                "id": 58759,
                "url": "https://www.tvmaze.com/episodes/58759/drop-dead-diva-1x01-pilot",
                "name": "Pilot",
                "season": 1,
                "number": 1,
                "type": "regular",
                "airdate": "2009-07-12",
                "airtime": "21:00",
                "airstamp": "2009-07-13T01:00:00+00:00",
                "runtime": 60,
                "rating": {
                  "average": 8.6
                },
                "image": {
                  "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/358/896101.jpg",
                  "original": "https://static.tvmaze.com/uploads/images/original_untouched/358/896101.jpg"
                },
                "summary": "<p></p>",
                "_links": {
                  "self": {
                    "href": "https://api.tvmaze.com/episodes/58759"
                  },
                  "show": {
                    "href": "https://api.tvmaze.com/shows/666"
                  }
                }
              },
              {
                "id": 58760,
                "url": "https://www.tvmaze.com/episodes/58760/drop-dead-diva-1x02-the-f-word",
                "name": "The F Word",
                "season": 1,
                "number": 2,
                "type": "regular",
                "airdate": "2009-07-19",
                "airtime": "21:00",
                "airstamp": "2009-07-20T01:00:00+00:00",
                "runtime": 60,
                "rating": {
                  "average": 8.7
                },
                "image": {
                  "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/358/896102.jpg",
                  "original": "https://static.tvmaze.com/uploads/images/original_untouched/358/896102.jpg"
                },
                "summary": "<p>.</p>",
                "_links": {
                  "self": {
                    "href": "https://api.tvmaze.com/episodes/58760"
                  },
                  "show": {
                    "href": "https://api.tvmaze.com/shows/666"
                  }
                }
              },
              {
                "id": 58761,
                "url": "https://www.tvmaze.com/episodes/58761/drop-dead-diva-1x03-do-over",
                "name": "Do Over",
                "season": 1,
                "number": 3,
                "type": "regular",
                "airdate": "2009-07-26",
                "airtime": "21:00",
                "airstamp": "2009-07-27T01:00:00+00:00",
                "runtime": 60,
                "rating": {
                  "average": 8
                },
                "image": {
                  "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/358/896103.jpg",
                  "original": "https://static.tvmaze.com/uploads/images/original_untouched/358/896103.jpg"
                },
                "summary": "<p>.</p>",
                "_links": {
                  "self": {
                    "href": "https://api.tvmaze.com/episodes/58761"
                  },
                  "show": {
                    "href": "https://api.tvmaze.com/shows/666"
                  }
                }
              }
            ]
            """.data(using: .utf8)
    }

    var invalidEpisodesData: Data? {
            """
            [
              {
                "id": 58759,
                "url": "https://www.tvmaze.com/episodes/58759/drop-dead-diva-1x01-pilot",
                "name": "Pilot",
                "season": 1,
                "number": 1,
                "type": "regular",
                "airdate": "2009-07-12",
                "airtime": "21:00",
                "airstamp": "2009-07-13T01:00:00+00:00",
                "runtime": 60,
                "rating": {
                  "average": 8.6
                },
                "image": {
                  "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/358/896101.jpg",
                  "original": "https://static.tvmaze.com/uploads/images/original_untouched/358/896101.jpg"
            """.data(using: .utf8)
    }
}
