//
//  AppViewBuilder.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/12/24.
//

import Core
import Explore
import Foundation
import Music
import Playlists
import SwiftUI

/// Builds Views that are referenced across modules or in the app layer.
class AppViewBuilder: SharedViewBuilding {
    static let shared = AppViewBuilder()
    
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
}
