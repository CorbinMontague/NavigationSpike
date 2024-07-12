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

/// Handles navigation at the app layer.
class AppCoordinator: AppCoordinating, ObservableObject {
    static let shared = AppCoordinator()
    
    // MARK: - Dependencies
    
    var exploreRouter: ExploreRouter? = nil
    var playlistsRouter: PlaylistsRouter? = nil
    
    // MARK: - Init
    
    init(selectedTab: Tab = .explore,
         exploreRouter: ExploreRouter? = nil,
         playlistsRouter: PlaylistsRouter? = nil) {
        self.selectedTab = selectedTab
        self.exploreRouter = exploreRouter
        self.playlistsRouter = playlistsRouter
    }
    
    // MARK: - AppCoordinating
    
    @Published var selectedTab: Tab {
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
            break // Some SharedDestinations only need view building, and have no supported route yet
        }
    }
}

// MARK: - DeeplinkHandling

// TODO: This should probably live in a seperate class that depends on AppCoordinating
extension AppCoordinator: DeeplinkHandling {
    func handle(deeplink: Deeplink) {
        print("Handle Deeplink: \(deeplink)")
        switch deeplink {
        case .explore:
            route(to: .explore)
        case .playlists:
            route(to: .playlists)
        case .playlist(let playlistName):
            route(to: .playlist(playlistName: playlistName))
        }
    }
}
