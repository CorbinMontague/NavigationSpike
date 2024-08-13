//
//  DeeplinkHandler.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

class DeeplinkHandler: DeeplinkHandling {
    
    // MARK: - Dependencies
    
    private let router: DeeplinkRouting
    
    // MARK: - Init
    
    init(router: DeeplinkRouting) {
        self.router = router
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
        guard let deeplink = Deeplink(url: url) else {
            print("Warning: URL is not a supported Deeplink")
            return false
        }
        
        router.route(to: deeplink, from: source)
        return true
    }
}
