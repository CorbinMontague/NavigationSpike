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
        Explore.Globals.viewBuilder = Explore.DestinationViewBuilder(externalViewBuilder: viewBuilder)
        Playlists.Globals.viewBuilder = Playlists.DestinationViewBuilder(externalViewBuilder: viewBuilder)
        Music.Globals.viewBuilder = Music.DestinationViewBuilder(externalViewBuilder: viewBuilder)
        
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
                coordinator.handle(url: url)
            }
        }
    }
}
