//
//  TVShowsAppTests.swift
//  TVShowsAppTests
//
//  Created by Felipe Semissatto on 14/01/24.
//

import XCTest
@testable import TVShowsApp

final class TVShowsAppTests: XCTestCase {

    // MARK: - Subject Under Tests
    private var sut: TVShowsServiceMock!

    // MARK: - Setup
    override func setUpWithError() throws {
        self.sut = TVShowsServiceMock()
    }

    // MARK: - Teardown
    override func tearDownWithError() throws {
        self.sut = nil
    }

    // MARK: - Tests

    func testGetTVShows_whenNilData_shouldReturnError() {
        // Given
        self.sut.mockData = nil
        var tvShowList: [TVShow]?
        var error: ApiServiceErrors?

        // When
        self.sut.getShows(onPage: 0) { result in
            switch result {
            case .success(let responseTVShows):
                tvShowList = responseTVShows
            case .failure(let responseError):
                error = responseError
            }
        }

        // Then
        XCTAssertNil(tvShowList)
        XCTAssertNotNil(error)
        XCTAssertEqual(error, .noDataFound)
    }

    func testGetTVShows_whenDataIsValid_ShouldReturnTVShowList() throws {
        // Given
        self.sut.mockData = self.validTVShowsData
        var tvShowList: [TVShow]?
        var error: ApiServiceErrors?

        // When
        self.sut.getShows(onPage: 0) { result in
            switch result {
            case .success(let responseTVShows):
                tvShowList = responseTVShows
            case .failure(let responseError):
                error = responseError
            }
        }

        // Then
        XCTAssertNil(error)
        XCTAssertNotNil(tvShowList)
        XCTAssertTrue(tvShowList?.count == 2)
    }

    func testGetTVShows_whenDataIsInvalid_ShouldThrowError() throws {
        // Given
        self.sut.mockData = invalidTVShowsData
        var tvShowList: [TVShow]?
        var error: ApiServiceErrors?

        // When
        self.sut.getShows(onPage: 0) { result in
            switch result {
            case .success(let responseSeries):
                tvShowList = responseSeries
            case .failure(let responseError):
                error = responseError
            }
        }

        // Then
        XCTAssertNil(tvShowList)
        XCTAssertNotNil(error)
        XCTAssertEqual(error, .failedToDecode)
    }
}

// MARK: - Mocked Datas
extension TVShowsAppTests {
    var validTVShowsData: Data? {
        """
        [
          {
            "id": 1,
            "url": "https://www.tvmaze.com/shows/1/under-the-dome",
            "name": "Under the Dome",
            "type": "Scripted",
            "language": "English",
            "genres": [
              "Drama",
              "Science-Fiction",
              "Thriller"
            ],
            "status": "Ended",
            "runtime": 60,
            "averageRuntime": 60,
            "premiered": "2013-06-24",
            "ended": "2015-09-10",
            "officialSite": "http://www.cbs.com/shows/under-the-dome/",
            "schedule": {
              "time": "22:00",
              "days": [
                "Thursday"
              ]
            },
            "rating": {
              "average": 6.5
            },
            "weight": 99,
            "network": {
              "id": 2,
              "name": "CBS",
              "country": {
                "name": "United States",
                "code": "US",
                "timezone": "America/New_York"
              },
              "officialSite": "https://www.cbs.com/"
            },
            "webChannel": null,
            "dvdCountry": null,
            "externals": {
              "tvrage": 25988,
              "thetvdb": 264492,
              "imdb": "tt1553656"
            },
            "image": {
              "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
              "original": "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"
            },
            "summary": "<p><b>Under the Dome</b></p>",
            "updated": 1631010933,
            "_links": {
              "self": {
                "href": "https://api.tvmaze.com/shows/1"
              },
              "previousepisode": {
                "href": "https://api.tvmaze.com/episodes/185054"
              }
            }
          },
          {
            "id": 2,
            "url": "https://www.tvmaze.com/shows/2/person-of-interest",
            "name": "Person of Interest",
            "type": "Scripted",
            "language": "English",
            "genres": [
              "Action",
              "Crime",
              "Science-Fiction"
            ],
            "status": "Ended",
            "runtime": 60,
            "averageRuntime": 60,
            "premiered": "2011-09-22",
            "ended": "2016-06-21",
            "officialSite": "http://www.cbs.com/shows/person_of_interest/",
            "schedule": {
              "time": "22:00",
              "days": [
                "Tuesday"
              ]
            },
            "rating": {
              "average": 8.8
            },
            "weight": 99,
            "network": {
              "id": 2,
              "name": "CBS",
              "country": {
                "name": "United States",
                "code": "US",
                "timezone": "America/New_York"
              },
              "officialSite": "https://www.cbs.com/"
            },
            "webChannel": null,
            "dvdCountry": null,
            "externals": {
              "tvrage": 28376,
              "thetvdb": 248742,
              "imdb": "tt1839578"
            },
            "image": {
              "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/163/407679.jpg",
              "original": "https://static.tvmaze.com/uploads/images/original_untouched/163/407679.jpg"
            },
            "summary": "<p>You are being watched.</p>",
            "updated": 1668668031,
            "_links": {
              "self": {
                "href": "https://api.tvmaze.com/shows/2"
              },
              "previousepisode": {
                "href": "https://api.tvmaze.com/episodes/659372"
              }
            }
          }
        ]
        """.data(using: .utf8)
    }

    var invalidTVShowsData: Data? {
            """
            [
              {
                "id": 1,
                "url": "https://www.tvmaze.com/shows/1/under-the-dome",
                "name": "Under the Dome",
                "type": "Scripted",
                "language": "English",
                "genres": [
                  "Drama",
                  "Science-Fiction",
                  "Thriller"
                ]
            """.data(using: .utf8)

    }
}
