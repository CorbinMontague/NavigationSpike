//
//  NavigationSpikeApp.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Explore
import Music
import Playlists
import SwiftUI

@main
struct NavigationSpikeApp: App {
    
    // prefer to use a DI library like:
    // - https://github.com/hmlongco/Resolver
    // - https://github.com/hmlongco/Factory
    init() {
        let appCoordinator = AppCoordinator.shared
        
        Explore.Globals.viewBuilder = Explore.DestinationViewBuilder(externalViewBuilder: appCoordinator)
        Explore.Globals.router = Explore.ExploreRouter(appCoordinator: appCoordinator)
        
        Playlists.Globals.viewBuilder = Playlists.DestinationViewBuilder(externalViewBuilder: appCoordinator)
        Playlists.Globals.router = Playlists.PlaylistsRouter(appCoordinator: appCoordinator)
        
        Music.Globals.viewBuilder = Music.DestinationViewBuilder(externalViewBuilder: appCoordinator)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
