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
    let router = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            TabBarView(coordinator: coordinator,
                       viewBuilder: viewBuilder)
            .onAppear {
                initAppDependencies()
            }
            .onOpenURL { url in
                let deeplinkHandler = DeeplinkHandler(router: router)
                deeplinkHandler.handle(url: url, source: .deeplink)
            }
        }
    }
    
    // MARK: - App Initialization
    
    // prefer to use a DI library like:
    // - https://github.com/hmlongco/Resolver
    // - https://github.com/hmlongco/Factory
    private func initAppDependencies() {
        initExplore()
        initPlaylists()
        initMusic()
        
        initApp()
    }
    
    private func initExplore() {
        Explore.Globals.router = ExploreRouter(appCoordinator: coordinator,
                                               externalRouter: router)
        Explore.Globals.viewBuilder = ExploreViewBuilder(externalViewBuilder: viewBuilder)
    }
    
    private func initPlaylists() {
        Playlists.Globals.router = PlaylistsRouter(appCoordinator: coordinator,
                                                   externalRouter: router)
        Playlists.Globals.viewBuilder = PlaylistsViewBuilder(externalViewBuilder: viewBuilder)
    }
    
    private func initMusic() {
        Music.Globals.router = MusicRouter(appCoordinator: coordinator,
                                           externalRouter: router)
        Music.Globals.viewBuilder = MusicViewBuilder(externalViewBuilder: viewBuilder)
    }
    
    private func initApp() {
        router.exploreRouter = Explore.Globals.router
        router.playlistsRouter = Playlists.Globals.router
        router.musicRouter = Music.Globals.router
    }
}
