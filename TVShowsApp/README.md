# TVShowsApp

This application allows users to browse TV shows, search for specific shows, view detailed information about them, and manage a list of favorite shows. The public API utilized is the TV API from TVMaze. For API details, refer to the documentation [here](https://www.tvmaze.com/api).

## Developed Features

- **Paged TV Show List:** View TV shows in a paged manner, with pagination dynamically loading as you scroll down. Scroll to the bottom to observe the pagination in action.
- **Search TV Shows:** Find TV shows by their names.
- **Detailed Views:** Access comprehensive details for TV shows, including name, poster, air days and times, genres, summaries, and a list of episodes categorized by season.
- **Episode Details:** Detailed information for each episode, encompassing name, number, season, summary, and an image.
- **Favorite TV Shows:** Save TV shows as favorites for quick access.
- **Delete from Favorites:** Remove a TV show from the favorites list by either tapping the star button on the detail view or swiping right to left on the Favorite List.
- **Browse Favorites:** Explore favorite TV shows alphabetically, with the option to click and view detailed information.

## Future Improvements

- **Networking:** Adoption of Combine framework for more efficient handling of API requests.
- **Local Storage:** Consider incorporating SwiftData for local data storage.
- **Cloud Integration:** Implement CloudKit to store local data in the cloud, ensuring data accessibility across devices.
- **UI Enhancements:**
  * Display an indicator on the TV Show card to signify that it's a user-favorited series in the lists;
  * Improve pagination, because currently we have to scroll through over 250 elements to get to the next page.
  

## Technical Decisions

- **Layout Framework:** SwiftUI.
- **Architecture:** MVVM-Coordinator.
- **Local Storage:** CoreData.

## Tests

-  **Unit Tests:** Applied unit tests for the API services.
-  **UI Tests:** While one UI test is currently implemented, the idea is to expand the coverage by adding more UI tests to the project. Additionally, efforts will be made to reduce the strong dependency of UI tests on API responses. 

## Development Environment

- **Xcode Version:** 14.3.1 (14E300c)
- **Swift Version:** 5
- **iOS Version:** 16.0 (iPhone and iPad)

## How to Install and Run the Project

### Using Git

1. Clone the repository to a local folder.

```bash
git clone https://github.com/felipesemissatto/TVShowsApp.git
```

2) Ensure you are on the main branch.
```
git checkout main
```

3) Update to the latest version.
```
git pull
```

4) Open the project in Xcode.
5) Choose a simulator or connected device. 
6) Run the project.

### Using Downloaded Zip File

1) Download the zip file from the main branch.
2) Extract the contents of the zip file.
3) Open the project in Xcode.
4) Choose a simulator or connected device.
5) Run the project.

Feel free to reach out if you encounter any issues or have further questions!

