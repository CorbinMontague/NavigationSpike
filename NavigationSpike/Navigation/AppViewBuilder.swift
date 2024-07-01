//
//  AppViewBuilder.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Explore
import Foundation
import Navigation
import SwiftUI

class AppViewBuilder: SharedViewBuilding {
    var exploreViewBuilder: Explore.ViewBuilding
    
    init(exploreViewBuilder: Explore.ViewBuilding) {
        self.exploreViewBuilder = exploreViewBuilder
    }
    
    func view(for destination: Navigation.SharedDestination) -> AnyView {
        switch destination {
        case .explore:
            return exploreViewBuilder.externalView(for: .explore)
        case .playlists:
            return AnyView(Text("Playlists TODO"))
        case .song(let song):
            return AnyView(Text("Song[\(song.name)] TODO"))
        case .artist(let artist):
            return AnyView(Text("Artist[\(artist.name)] TODO"))
        }
    }
}
