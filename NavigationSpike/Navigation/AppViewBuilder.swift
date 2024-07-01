//
//  AppViewBuilder.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import Navigation
import SwiftUI

class AppViewBuilder: SharedViewBuilding {
    
    func view(for destination: Navigation.SharedDestination) -> AnyView {
        switch destination {
        case .explore:
            return AnyView(Text("Explore TODO"))
        case .playlists:
            return AnyView(Text("Playlists TODO"))
        case .song:
            return AnyView(Text("Song TODO"))
        case .artist:
            return AnyView(Text("Artist TODO"))
        }
    }
}
