//
//  PlaylistsDeeplinkHandler.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

public final class PlaylistsDeeplinkHandler: DeeplinkHandling {
    
    // MARK: - Dependencies
    
    private let router: PlaylistsRouting
    
    // MARK: - Init
    
    public init(router: PlaylistsRouting) {
        self.router = router
    }
    
    // MARK: - DeeplinkHandling
    
    public func canHandle(url: URL) -> Bool {
        if let _ = PlaylistsDeeplink(url: url) {
            return true
        }
        
        print("URL is not a supported PlaylistsDeeplink")
        return false
    }
    
    @discardableResult public func handle(url: URL, source: DeeplinkSource) -> Bool {
        guard let deeplink = PlaylistsDeeplink(url: url) else {
            print("URL is not a supported PlaylistsDeeplink")
            return false
        }
        
        router.route(to: deeplink, from: source)
        return true
    }
}
