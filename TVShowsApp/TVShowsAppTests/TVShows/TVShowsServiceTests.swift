//
//  TVShowsServiceTests.swift
//  TVShowsAppTests
//
//  Created by Felipe Semissatto on 14/01/24.
//

import XCTest
@testable import TVShowsApp

final class TVShowsServiceTests: XCTestCase {

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

    // MARK: Paginated TV shows
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

    // MARK: Search TV shows by name

    func testSearchShowByName_whenDataIsValid_ShouldReturnShowList() throws {
        // Given
        self.sut.mockData = validSearchShowData
        let showName = "girls"
        var rankedTVShows: [RankedShow]?
        var error: ApiServiceErrors?

        // When
        self.sut.searchShow(by: showName) { result in
            switch result {
            case .success(let responseRankedTVShows):
                rankedTVShows = responseRankedTVShows
            case .failure(let responseError):
                error = responseError
            }
        }

        // Then
        XCTAssertNil(error)
        XCTAssertNotNil(rankedTVShows)
        XCTAssertTrue(rankedTVShows?.count == 10)
    }

    func testSearchShowByName_whenDataIsInvalid_ShouldThrowError() throws {
        // Given
        self.sut.mockData = invalidSearchShowData
        let showName = "girls"
        var rankedTVShows: [RankedShow]?
        var error: ApiServiceErrors?

        // When
        self.sut.searchShow(by: showName) { result in
            switch result {
            case .success(let responseRankedTVShows):
                rankedTVShows = responseRankedTVShows
            case .failure(let responseError):
                error = responseError
            }
        }

        // Then
        XCTAssertNil(rankedTVShows)
        XCTAssertNotNil(error)
        XCTAssertEqual(error, .failedToDecode)
    }
}

// MARK: - Mocked Datas
// swiftlint:disable file_length
extension TVShowsServiceTests {
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

    var validSearchShowData: Data? {
            """
            [
              {
                "score": 0.9085543,
                "show": {
                  "id": 139,
                  "url": "https://www.tvmaze.com/shows/139/girls",
                  "name": "Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Drama",
                    "Romance"
                  ],
                  "status": "Ended",
                  "runtime": 30,
                  "averageRuntime": 30,
                  "premiered": "2012-04-15",
                  "ended": "2017-04-16",
                  "officialSite": "http://www.hbo.com/girls",
                  "schedule": {
                    "time": "22:00",
                    "days": [
                      "Sunday"
                    ]
                  },
                  "rating": {
                    "average": 6.7
                  },
                  "weight": 98,
                  "network": {
                    "id": 8,
                    "name": "HBO",
                    "country": {
                      "name": "United States",
                      "code": "US",
                      "timezone": "America/New_York"
                    },
                    "officialSite": "https://www.hbo.com/"
                  },
                  "webChannel": null,
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": 30124,
                    "thetvdb": 220411,
                    "imdb": "tt1723816"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/31/78286.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/31/78286.jpg"
                  },
                  "summary": "<p>This Emmy winning.</p>",
                  "updated": 1611310521,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/139"
                    },
                    "previousepisode": {
                      "href": "https://api.tvmaze.com/episodes/1079686"
                    }
                  }
                }
              },
              {
                "score": 0.88830334,
                "show": {
                  "id": 41734,
                  "url": "https://www.tvmaze.com/shows/41734/girls",
                  "name": "GIRLS",
                  "type": "Scripted",
                  "language": "Mongolian",
                  "genres": [
                    "Comedy"
                  ],
                  "status": "Ended",
                  "runtime": 41,
                  "averageRuntime": null,
                  "premiered": null,
                  "ended": null,
                  "officialSite": null,
                  "schedule": {
                    "time": "",
                    "days": [
                      "Thursday"
                    ]
                  },
                  "rating": {
                    "average": null
                  },
                  "weight": 62,
                  "network": {
                    "id": 1672,
                    "name": "UBS",
                    "country": {
                      "name": "Mongolia",
                      "code": "MN",
                      "timezone": "Asia/Ulaanbaatar"
                    },
                    "officialSite": null
                  },
                  "webChannel": null,
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": null,
                    "thetvdb": null,
                    "imdb": "tt8709752"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/191/478539.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/191/478539.jpg"
                  },
                  "summary": null,
                  "updated": 1632080861,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/41734"
                    }
                  }
                }
              },
              {
                "score": 0.70144755,
                "show": {
                  "id": 49334,
                  "url": "https://www.tvmaze.com/shows/49334/shining-girls",
                  "name": "Shining Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Crime",
                    "Thriller",
                    "Supernatural"
                  ],
                  "status": "To Be Determined",
                  "runtime": null,
                  "averageRuntime": 49,
                  "premiered": "2022-04-29",
                  "ended": null,
                  "officialSite": "https://tv.apple.com/show/shining-girls/umc.cmc.22xs4xobsimzy5qqdif0rhmdy",
                  "schedule": {
                    "time": "",
                    "days": [
                      "Friday"
                    ]
                  },
                  "rating": {
                    "average": 7.5
                  },
                  "weight": 98,
                  "network": null,
                  "webChannel": {
                    "id": 310,
                    "name": "Apple TV+",
                    "country": null,
                    "officialSite": "https://tv.apple.com/"
                  },
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": null,
                    "thetvdb": 385810,
                    "imdb": "tt2953250"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/406/1015813.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/406/1015813.jpg"
                  },
                  "summary": "<p><b>Shining Girls</b> .</p>",
                  "updated": 1654448061,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/49334"
                    },
                    "previousepisode": {
                      "href": "https://api.tvmaze.com/episodes/2272289"
                    }
                  }
                }
              },
              {
                "score": 0.70113313,
                "show": {
                  "id": 33320,
                  "url": "https://www.tvmaze.com/shows/33320/derry-girls",
                  "name": "Derry Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Comedy"
                  ],
                  "status": "Ended",
                  "runtime": null,
                  "averageRuntime": 33,
                  "premiered": "2018-01-04",
                  "ended": "2022-05-18",
                  "officialSite": "http://www.channel4.com/programmes/derry-girls",
                  "schedule": {
                    "time": "",
                    "days": []
                  },
                  "rating": {
                    "average": 8.1
                  },
                  "weight": 97,
                  "network": {
                    "id": 45,
                    "name": "Channel 4",
                    "country": {
                      "name": "United Kingdom",
                      "code": "GB",
                      "timezone": "Europe/London"
                    },
                    "officialSite": "https://www.channel4.com/"
                  },
                  "webChannel": null,
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": null,
                    "thetvdb": 338903,
                    "imdb": "tt7120662"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/402/1007479.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/402/1007479.jpg"
                  },
                  "summary": "<p>16-year-old Erin Quinn lives with her uncompromising mother</p>",
                  "updated": 1665155002,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/33320"
                    },
                    "previousepisode": {
                      "href": "https://api.tvmaze.com/episodes/2323336"
                    }
                  }
                }
              },
              {
                "score": 0.70113313,
                "show": {
                  "id": 525,
                  "url": "https://www.tvmaze.com/shows/525/gilmore-girls",
                  "name": "Gilmore Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Drama",
                    "Comedy",
                    "Romance"
                  ],
                  "status": "Ended",
                  "runtime": 60,
                  "averageRuntime": 60,
                  "premiered": "2000-10-05",
                  "ended": "2007-05-15",
                  "officialSite": null,
                  "schedule": {
                    "time": "21:00",
                    "days": [
                      "Tuesday"
                    ]
                  },
                  "rating": {
                    "average": 8.2
                  },
                  "weight": 97,
                  "network": {
                    "id": 5,
                    "name": "The CW",
                    "country": {
                      "name": "United States",
                      "code": "US",
                      "timezone": "America/New_York"
                    },
                    "officialSite": "https://www.cwtv.com/"
                  },
                  "webChannel": null,
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": 3683,
                    "thetvdb": 76568,
                    "imdb": "tt0238784"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/4/11308.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/4/11308.jpg"
                  },
                  "summary": "<p><b>Gilmore Girls</b>.</p>",
                  "updated": 1618158592,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/525"
                    },
                    "previousepisode": {
                      "href": "https://api.tvmaze.com/episodes/47639"
                    }
                  }
                }
              },
              {
                "score": 0.7005731,
                "show": {
                  "id": 42986,
                  "url": "https://www.tvmaze.com/shows/42986/paper-girls",
                  "name": "Paper Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Drama",
                    "Science-Fiction"
                  ],
                  "status": "Ended",
                  "runtime": null,
                  "averageRuntime": 44,
                  "premiered": "2022-07-29",
                  "ended": "2022-07-29",
                  "officialSite": "https://www.primevideo.com/detail/0SXAIJ5V3UWT5NQ8O0DV44N2F4/",
                  "schedule": {
                    "time": "",
                    "days": []
                  },
                  "rating": {
                    "average": 6.6
                  },
                  "weight": 96,
                  "network": null,
                  "webChannel": {
                    "id": 3,
                    "name": "Prime Video",
                    "country": null,
                    "officialSite": "https://www.primevideo.com"
                  },
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": null,
                    "thetvdb": 368187,
                    "imdb": "tt10623646"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/417/1043587.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/417/1043587.jpg"
                  },
                  "summary": "<p><b>Paper Girls </b></p>",
                  "updated": 1663799366,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/42986"
                    },
                    "previousepisode": {
                      "href": "https://api.tvmaze.com/episodes/2342540"
                    }
                  }
                }
              },
              {
                "score": 0.6999171,
                "show": {
                  "id": 23542,
                  "url": "https://www.tvmaze.com/shows/23542/good-girls",
                  "name": "Good Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Drama",
                    "Comedy",
                    "Crime"
                  ],
                  "status": "Ended",
                  "runtime": 60,
                  "averageRuntime": 60,
                  "premiered": "2018-02-26",
                  "ended": "2021-07-22",
                  "officialSite": "https://www.nbc.com/good-girls",
                  "schedule": {
                    "time": "21:00",
                    "days": [
                      "Thursday"
                    ]
                  },
                  "rating": {
                    "average": 7.2
                  },
                  "weight": 95,
                  "network": {
                    "id": 1,
                    "name": "NBC",
                    "country": {
                      "name": "United States",
                      "code": "US",
                      "timezone": "America/New_York"
                    },
                    "officialSite": "https://www.nbc.com/"
                  },
                  "webChannel": null,
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": null,
                    "thetvdb": 328577,
                    "imdb": "tt6474378"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/297/744253.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/297/744253.jpg"
                  },
                  "summary": "<p><b>Good Girls</b></p>",
                  "updated": 1669208118,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/23542"
                    },
                    "previousepisode": {
                      "href": "https://api.tvmaze.com/episodes/2108575"
                    }
                  }
                }
              },
              {
                "score": 0.69747716,
                "show": {
                  "id": 59431,
                  "url": "https://www.tvmaze.com/shows/59431/surfside-girls",
                  "name": "Surfside Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Drama",
                    "Children",
                    "Family"
                  ],
                  "status": "To Be Determined",
                  "runtime": null,
                  "averageRuntime": 24,
                  "premiered": "2022-08-19",
                  "ended": null,
                  "officialSite": "https://tv.apple.com/show/surfside-girls/umc.cmc.4371g2xacdr0wfs071dm3q30x",
                  "schedule": {
                    "time": "",
                    "days": []
                  },
                  "rating": {
                    "average": null
                  },
                  "weight": 89,
                  "network": null,
                  "webChannel": {
                    "id": 310,
                    "name": "Apple TV+",
                    "country": null,
                    "officialSite": "https://tv.apple.com/"
                  },
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": null,
                    "thetvdb": 414549,
                    "imdb": null
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/418/1047231.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/418/1047231.jpg"
                  },
                  "summary": "<p>.</p>",
                  "updated": 1661084008,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/59431"
                    },
                    "previousepisode": {
                      "href": "https://api.tvmaze.com/episodes/2376047"
                    }
                  }
                }
              },
              {
                "score": 0.6956815,
                "show": {
                  "id": 1073,
                  "url": "https://www.tvmaze.com/shows/1073/bomb-girls",
                  "name": "Bomb Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Drama",
                    "Romance",
                    "War"
                  ],
                  "status": "Ended",
                  "runtime": 60,
                  "averageRuntime": 60,
                  "premiered": "2012-01-04",
                  "ended": "2013-04-29",
                  "officialSite": null,
                  "schedule": {
                    "time": "20:00",
                    "days": [
                      "Monday"
                    ]
                  },
                  "rating": {
                    "average": 7.9
                  },
                  "weight": 80,
                  "network": {
                    "id": 67,
                    "name": "Global",
                    "country": {
                      "name": "Canada",
                      "code": "CA",
                      "timezone": "America/Halifax"
                    },
                    "officialSite": null
                  },
                  "webChannel": null,
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": 30600,
                    "thetvdb": 254378,
                    "imdb": "tt1955311"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/7/17549.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/7/17549.jpg"
                  },
                  "summary": "<p>Set in the 1940s</p>",
                  "updated": 1592496010,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/1073"
                    },
                    "previousepisode": {
                      "href": "https://api.tvmaze.com/episodes/108024"
                    }
                  }
                }
              },
              {
                "score": 0.69438046,
                "show": {
                  "id": 1308,
                  "url": "https://www.tvmaze.com/shows/1308/bad-girls",
                  "name": "Bad Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Drama",
                    "Crime",
                    "Romance"
                  ],
                  "status": "Ended",
                  "runtime": 60,
                  "averageRuntime": 61,
                  "premiered": "1999-06-01",
                  "ended": "2006-12-18",
                  "officialSite": null,
                  "schedule": {
                    "time": "21:00",
                    "days": [
                      "Thursday"
                    ]
                  },
                  "rating": {
                    "average": 7.8
                  },
                  "weight": 83,
                  "network": {
                    "id": 35,
                    "name": "ITV1",
                    "country": {
                      "name": "United Kingdom",
                      "code": "GB",
                      "timezone": "Europe/London"
                    },
                    "officialSite": "https://www.itv.com/"
                  },
                  "webChannel": null,
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": 2701,
                    "thetvdb": 75328,
                    "imdb": "tt0203248"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/7/18492.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/7/18492.jpg"
                  },
                  "summary": "<p></p>",
                  "updated": 1614194531,
                  "_links": {
                    "self": {
                      "href": "https://api.tvmaze.com/shows/1308"
                    },
                    "previousepisode": {
                      "href": "https://api.tvmaze.com/episodes/111010"
                    }
                  }
                }
              }
            ]
            """.data(using: .utf8)
    }

    var invalidSearchShowData: Data? {
            """
            [
              {
                "score": 0.9085543,
                "show": {
                  "id": 139,
                  "url": "https://www.tvmaze.com/shows/139/girls",
                  "name": "Girls",
                  "type": "Scripted",
                  "language": "English",
                  "genres": [
                    "Drama",
                    "Romance"
                  ],
                  "status": "Ended",
                  "runtime": 30,
                  "averageRuntime": 30,
                  "premiered": "2012-04-15",
                  "ended": "2017-04-16",
                  "officialSite": "http://www.hbo.com/girls",
                  "schedule": {
                    "time": "22:00",
                    "days": [
                      "Sunday"
                    ]
                  },
                  "rating": {
                    "average": 6.7
                  },
                  "weight": 98,
                  "network": {
                    "id": 8,
                    "name": "HBO",
                    "country": {
                      "name": "United States",
                      "code": "US",
                      "timezone": "America/New_York"
                    },
                    "officialSite": "https://www.hbo.com/"
                  },
                  "webChannel": null,
                  "dvdCountry": null,
                  "externals": {
                    "tvrage": 30124,
                    "thetvdb": 220411,
                    "imdb": "tt1723816"
                  },
                  "image": {
                    "medium": "https://static.tvmaze.com/uploads/images/medium_portrait/31/78286.jpg",
                    "original": "https://static.tvmaze.com/uploads/images/original_untouched/31/78286.jpg"
                  },
                  "summary": "<p>This Emmy winning series.</p>",
                  "updated": 1611310521,
                  "_links": {
                    "self":
            """.data(using: .utf8)
    }
}
// swiftlint:enable file_length
