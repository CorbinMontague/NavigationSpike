//
//  AppViewBuilder.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Explore
import Foundation
import Music
import Navigation
import SwiftUI

class AppViewBuilder: SharedViewBuilding {
    
    func view(for screen: Navigation.SharedScreen) -> AnyView {
        switch screen {
        case .explore:
            return Explore.ViewFactory.makeExploreCoordinator()
        case .playlists:
            return AnyView(Text("Playlists TODO"))
        case .song(let song):
            return Music.ViewFactory.makeSongView(song: song)
        case .artist(let artist):
            return Music.ViewFactory.makeArtistView(artist: artist)
        }
    }
}
