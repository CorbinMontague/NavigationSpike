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

enum Tab: Hashable {
    case explore
    case playlists
}

class AppCoordinator: SharedViewBuilding, ObservableObject {
    static let shared = AppCoordinator()
    
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
    
    func handle(deeplink: Deeplink) {
        print("Handle Deeplink: \(deeplink)")
        switch deeplink {
        case .explore:
            selectedTab = .explore
        case .playlists:
            selectedTab = .playlists
        case .song(let songName):
            selectedTab = .explore
        }
    }
}
