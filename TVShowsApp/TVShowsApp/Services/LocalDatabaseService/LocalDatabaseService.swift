//
//  LocalDatabaseService.swift
//  TVShowsApp
//
//  Created by Felipe Semissatto on 16/01/24.
//

import Foundation
import CoreData

class LocalDatabaseService: LocalDatabaseServiceProtocol {

    /// CoreData stack.
    private let persistContainer: NSPersistentContainer

    /// Background context of all ``TVShow`` objects managed by the store.
    private lazy var context: NSManagedObjectContext = persistContainer.newBackgroundContext()

    /// TVShows persisted on CoreData.
    private var coreDataTVShows: [TVShowEntity] = []

    init() {
        self.persistContainer = NSPersistentContainer(name: CoreDataConstants.modelName)
        self.persistContainer.loadPersistentStores { _, error in
            // TODO: Show an error alert
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        self.loadData()
    }

    func loadData() {
        do {
            let request = TVShowEntity.fetchRequest()
            self.coreDataTVShows = try self.context.fetch(request)
        } catch {
            print("Error loading tv shows: \(error)")
        }
    }

    func getFavoriteList() -> [TVShow] {
        return coreDataTVShows.map { tvShowEntity in
            var poster: Poster?
            if let posterEntity = tvShowEntity.onPoster {
                poster = Poster(medium: posterEntity.medium ?? "",
                                original: posterEntity.original ?? "")
            }

            let schedule = Schedule(time: tvShowEntity.onSchedule?.time ?? "",
                                    days: tvShowEntity.onSchedule?.days ?? [])

            return TVShow(id: Int(tvShowEntity.id),
                          name: tvShowEntity.name ?? "Unknown",
                          image: poster,
                          schedule: schedule,
                          genres: tvShowEntity.genres ?? [],
                          summary: tvShowEntity.summary ?? "")
        }
    }

    func add(_ tvShow: TVShow) {
        let poster = PosterEntity(context: context)
        poster.medium = tvShow.image?.medium ?? ""
        poster.original = tvShow.image?.original ?? ""

        let schedule = ScheduleEntity(context: context)
        schedule.days = tvShow.schedule.days
        schedule.time = tvShow.schedule.time

        let tvShowEntity = TVShowEntity(context: context)
        tvShowEntity.id = Int64(tvShow.id)
        tvShowEntity.name = tvShow.name
        tvShowEntity.onPoster = poster
        tvShowEntity.onSchedule = schedule
        tvShowEntity.genres = tvShow.genres
        tvShowEntity.summary = tvShow.summary

        coreDataTVShows.append(tvShowEntity)
        saveContext()
    }

    func removeTVShow(by tvShowId: Int) {
        if let index = coreDataTVShows.firstIndex(where: { $0.id == tvShowId }) {
            let removedTVShow = coreDataTVShows.remove(at: index)
            context.delete(removedTVShow)
            saveContext()
        }
    }

    // MARK: - Private Methods

    private func saveContext() {
        guard context.hasChanges else { return }

        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
            context.rollback()
        }
    }
}
