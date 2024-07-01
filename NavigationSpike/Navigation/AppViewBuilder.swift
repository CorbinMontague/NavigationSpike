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
    
    func view(for destination: Navigation.SharedDestination) -> AnyView {
        switch destination {
        case .explore:
            return Explore.ViewFactory.makeExploreView()
        case .playlists:
            return AnyView(Text("Playlists TODO"))
        case .song(let song):
            return Music.ViewFactory.makeSongView(song: song)
        case .artist(let artist):
            return Music.ViewFactory.makeArtistView(artist: artist)
        }
    }
}
