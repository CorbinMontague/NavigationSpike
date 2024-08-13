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

/// Builds cross-module Views.
class AppViewBuilder: SharedScreenViewBuilding {
    static let shared = AppViewBuilder()
    
    func view(for screen: SharedScreen) -> AnyView {
        switch screen {
            // Internal
        case .devTools:
            return AnyView(ViewFactory.makeDevToolsView())
            
            // External
        case .explore:
            return Explore.ViewFactory.makeExploreCoordinatorAnyView()
        case .playlists:
            return Playlists.ViewFactory.makePlaylistsCoordinatorAnyView()
        case .song(let song):
            return Music.ViewFactory.makeSongAnyView(song: song)
        case .artist(let artist):
            return Music.ViewFactory.makeArtistAnyView(artist: artist)
        }
    }
}
