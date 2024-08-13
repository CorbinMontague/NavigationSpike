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

class DeeplinkHandler: DeeplinkHandling {
    
    // MARK: - Dependencies
    
    private let router: DeeplinkRouting
    
    private let exploreDeeplinkHandler: DeeplinkHandling
    private let playlistsDeeplinkHandler: DeeplinkHandling
    private let musicDeeplinkHandler: DeeplinkHandling
    
    private lazy var deeplinkHandlers: [any DeeplinkHandling] = [
        self,
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
        self.exploreDeeplinkHandler = exploreDeeplinkHandler
        self.playlistsDeeplinkHandler = playlistsDeeplinkHandler
        self.musicDeeplinkHandler = musicDeeplinkHandler
    }
    
    // MARK: - DeeplinkHandling
    
    func canHandle(url: URL) -> Bool {
        if let _ = Deeplink(url: url) {
            return true
        }
        
        print("Warning: URL is not a supported Deeplink")
        return false
    }
    
    @discardableResult func handle(url: URL, source: DeeplinkSource) -> Bool {
        for deeplinkHandler in deeplinkHandlers {
            if deeplinkHandler.canHandle(url: url) {
                deeplinkHandler.handle(url: url, source: source)
                return true
            }
        }
        
        print("Warning: URL is not a supported Deeplink")
        return false
    }
}
