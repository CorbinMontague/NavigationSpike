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
        let coordinator = AppCoordinator.shared
        
        Explore.Globals.viewBuilder = Explore.DestinationViewBuilder(externalViewBuilder: coordinator)
        Explore.Globals.router = Explore.ExploreRouter(appCoordinator: coordinator)
        
        Playlists.Globals.viewBuilder = Playlists.DestinationViewBuilder(externalViewBuilder: coordinator)
        Playlists.Globals.router = Playlists.PlaylistsRouter(appCoordinator: coordinator)
        
        Music.Globals.viewBuilder = Music.DestinationViewBuilder(externalViewBuilder: coordinator)
        
        coordinator.exploreRouter = Explore.Globals.router
        coordinator.playlistsRouter = Playlists.Globals.router
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
