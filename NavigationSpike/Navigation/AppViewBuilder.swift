//
//  AppViewBuilder.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Explore
import Foundation
import Music
import SwiftUI

class AppViewBuilder: SharedViewBuilding {
    static let shared = AppViewBuilder()
    
    func view(at destination: SharedDestination) -> AnyView {
        switch destination {
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
