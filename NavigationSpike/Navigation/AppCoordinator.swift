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
    
    // MARK: - Dependencies
    
    var exploreRouter: ExploreRouter? = nil
    var playlistsRouter: PlaylistsRouter? = nil
    
    // MARK: - AppCoordinating
    
    @Published var selectedTab: Tab = .explore {
        didSet {
            print("selectedTab: \(selectedTab)")
        }
    }
    
    func route(to destination: SharedDestination) {
        switch destination {
        case .explore:
            exploreRouter?.route(to: destination)
        case .playlists, .playlist:
            playlistsRouter?.route(to: destination)
        default:
            break // SharedDestinations that only need view building, and no routing
        }
    }
    
    // MARK: - View Building
    
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
        default:
            return AnyView(EmptyView()) // SharedDestinations that only need routing, and no view building
        }
    }
    
    // MARK: - Deeplink Handling
    
    // TODO: Move into its own struct
    func handle(deeplink: Deeplink) {
        print("Handle Deeplink: \(deeplink)")
        switch deeplink {
        case .explore:
            route(to: .explore)
        case .playlists:
            route(to: .playlists)
        case .playlist(let playlistId):
            route(to: .playlist(playlistId: playlistId))
        }
    }
}
