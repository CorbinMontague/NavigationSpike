//
//  ExploreDeeplinkHandler.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

public final class ExploreDeeplinkHandler: DeeplinkHandling {
    
    // MARK: - Dependencies
    
    private let router: ExploreRouting
    
    // MARK: - Init
    
    public init(router: ExploreRouting) {
        self.router = router
    }
    
    // MARK: - DeeplinkHandling
    
    public func canHandle(url: URL) -> Bool {
        if let _ = ExploreDeeplink(url: url) {
            return true
        }
        
        print("Warning: URL is not a supported ExploreDeeplink")
        return false
    }
    
    @discardableResult public func handle(url: URL, source: DeeplinkSource) -> Bool {
        guard let deeplink = ExploreDeeplink(url: url) else {
            print("Warning: URL is not a supported ExploreDeeplink")
            return false
        }
        
        router.route(to: deeplink, from: source)
        return true
    }
}
