//
//  AppCoordinator.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Explore
import Foundation
import Music
import Playlists
import SwiftUI

class AppCoordinator: AppCoordinating, SharedViewBuilding, ObservableObject {
    static let shared = AppCoordinator()
    
    let exploreRouter = Explore.Globals.router
    
    @Published var selectedTab: Tab = .explore
    
    func view(at destination: SharedDestination) -> AnyView {
        switch destination {
        case .explore:
            return Explore.ViewFactory.makeExploreCoordinatorView()
        case .playlists:
            return Playlists.ViewFactory.makePlaylistsCoordinatorView()
        case .song(let song):
            return Music.ViewFactory.makeSongView(song: song)
        case .artist(let artist):
            return Music.ViewFactory.makeArtistView(artist: artist)
        }
    }
    
    func route(to destination: SharedDestination) {
        switch destination {
        case .explore:
            exploreRouter?.route(to: destination)
        default:
            break
        }
    }
    
    func handle(deeplink: Deeplink) {
        print("Handle Deeplink: \(deeplink)")
        switch deeplink {
        case .explore:
            route(to: .explore)
        case .playlists:
            route(to: .playlists)
        }
    }
}
