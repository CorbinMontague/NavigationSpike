//
//  MusicDeeplinkHandler.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

public final class MusicDeeplinkHandler: DeeplinkHandling {
    
    // MARK: - Dependencies
    
    private let router: MusicRouting
    
    // MARK: - Init
    
    public init(router: MusicRouting) {
        self.router = router
    }
    
    // MARK: - DeeplinkHandling
    
    public func canHandle(url: URL) -> Bool {
        if let _ = MusicDeeplink(url: url) {
            return true
        }
        
        print("URL is not a supported MusicDeeplink")
        return false
    }
    
    @discardableResult public func handle(url: URL, source: DeeplinkSource) -> Bool {
        guard let deeplink = MusicDeeplink(url: url) else {
            print("URL is not a supported MusicDeeplink")
            return false
        }
        
        router.route(to: deeplink, from: source)
        return true
    }
}
