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
        Explore.Globals.router = Explore.ExploreRouter(appCoordinator: coordinator)
        
        Playlists.Globals.viewBuilder = Playlists.DestinationViewBuilder(externalViewBuilder: viewBuilder)
        Playlists.Globals.router = Playlists.PlaylistsRouter(appCoordinator: coordinator)
        
        Music.Globals.viewBuilder = Music.DestinationViewBuilder(externalViewBuilder: viewBuilder)
        
        self.coordinator.exploreRouter = Explore.Globals.router
        self.coordinator.playlistsRouter = Playlists.Globals.router
    }
    
    var body: some Scene {
        WindowGroup {
            TabBarView(coordinator: coordinator,
                       viewBuilder: viewBuilder)
            .onAppear {
                initAppDependencies()
            }
            .onOpenURL { url in
                guard let deeplink = Deeplink(url: url) else { return }
                coordinator.handle(deeplink: deeplink)
            }
        }
    }
}
