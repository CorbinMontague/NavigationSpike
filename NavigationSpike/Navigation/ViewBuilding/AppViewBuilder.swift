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
    
    // MARK: - SharedScreenViewBuilding
    
    func view(for screen: SharedScreen) -> AnyView {
        switch screen {
            // Internal
        case .devTools:
            return view(for: .devTools)
            
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
    
    // MARK: - ScreenViewBuilding
    
    @ViewBuilder func view(for screen: Screen) -> some View {
        switch screen {
        case .devTools:
            ViewFactory.makeDevToolsView()
        }
    }
}
