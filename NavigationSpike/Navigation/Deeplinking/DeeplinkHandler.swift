//
//  DeeplinkHandler.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation
import Explore
import Music
import Playlists

class DeeplinkHandler: CompositeDeeplinkHandling {
    
    private class NavigationSpikeDeeplinkHandler: DeeplinkHandling {
        
        private let router: DeeplinkRouting
        
        init(router: DeeplinkRouting) {
            self.router = router
        }
        
        // MARK: - DeeplinkHandling
        
        func canHandle(url: URL) -> Bool {
            if let _ = Deeplink(url: url) {
                return true
            }
            
            return false
        }
        
        @discardableResult func handle(url: URL, source: DeeplinkSource) -> Bool {
            if let deeplink = Deeplink(url: url) {
                router.route(to: deeplink, from: source)
                return true
            }
            
            return false
        }
    }

    // MARK: - Dependencies
    
    private let router: DeeplinkRouting
    
    private let appDeeplinkHandler: DeeplinkHandling
    private let exploreDeeplinkHandler: DeeplinkHandling
    private let playlistsDeeplinkHandler: DeeplinkHandling
    private let musicDeeplinkHandler: DeeplinkHandling
    
    private lazy var deeplinkHandlers: [any DeeplinkHandling] = [
        appDeeplinkHandler,
        exploreDeeplinkHandler,
        playlistsDeeplinkHandler,
        musicDeeplinkHandler
    ]
    
    // MARK: - Init
    
    init(router: DeeplinkRouting,
         exploreDeeplinkHandler: DeeplinkHandling = Explore.Globals.deeplinkHandler!,
         playlistsDeeplinkHandler: DeeplinkHandling = Playlists.Globals.deeplinkHandler!,
         musicDeeplinkHandler: DeeplinkHandling = Music.Globals.deeplinkHandler!) {
        self.router = router
        self.appDeeplinkHandler = NavigationSpikeDeeplinkHandler(router: router)
        self.exploreDeeplinkHandler = exploreDeeplinkHandler
        self.playlistsDeeplinkHandler = playlistsDeeplinkHandler
        self.musicDeeplinkHandler = musicDeeplinkHandler
    }
    
    // MARK: - CompositeDeeplinkHandling
    
    func canHandle(url: URL) -> Bool {
        for deeplinkHandler in deeplinkHandlers {
            if deeplinkHandler.canHandle(url: url) {
                return true
            }
        }
        
        return false
    }
    
    @discardableResult func handle(url: URL, source: DeeplinkSource) -> Bool {
        for deeplinkHandler in deeplinkHandlers {
            if deeplinkHandler.handle(url: url, source: source) {
                return true
            }
        }
        
        return false
    }
}
