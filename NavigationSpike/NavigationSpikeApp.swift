//
//  NavigationSpikeApp.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 7/1/24.
//

import Core
import Explore
import Music
import Playlists
import SwiftUI

@main
struct NavigationSpikeApp: App {
    
    @StateObject var coordinator = AppCoordinator.shared
    let viewBuilder = AppViewBuilder.shared
    
    // prefer to use a DI library like:
    // - https://github.com/hmlongco/Resolver
    // - https://github.com/hmlongco/Factory
    private func initAppDependencies() {
        Explore.Globals.viewBuilder = ExploreViewBuilder(externalViewBuilder: viewBuilder)
        
        Playlists.Globals.viewBuilder = PlaylistsViewBuilder(externalViewBuilder: viewBuilder)
        
        Music.Globals.viewBuilder = MusicViewBuilder(externalViewBuilder: viewBuilder)
        
        self.coordinator.exploreCoordinator = Explore.Globals.coordinator
        self.coordinator.playlistsCoordinator = Playlists.Globals.coordinator
    }
    
    var body: some Scene {
        WindowGroup {
            TabBarView(coordinator: coordinator,
                       viewBuilder: viewBuilder)
            .onAppear {
                initAppDependencies()
            }
            .onOpenURL { url in
                // TODO: Tell DeeplinkHandler to handle this
            }
        }
    }
}
