//
//  MusicRouter.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

/// Concrete `MusicRouting` that implements routing the user to specific views within `Music`.
final class MusicRouter: MusicRouting {
    
    // MARK: - Dependencies
    
    private var appCoordinator: AppCoordinating
    private weak var externalRouter: SharedDeeplinkRouting?
    
    // MARK: - Init
    
    init(appCoordinator: AppCoordinating,
         externalRouter: SharedDeeplinkRouting? = nil) {
        self.appCoordinator = appCoordinator
        self.externalRouter = externalRouter
    }
    
    // MARK: - MusicRouting
    
    func route(to deeplink: MusicDeeplink, from source: DeeplinkSource) {
        switch deeplink {
        case .external(let sharedDeeplink):
            externalRouter?.route(to: sharedDeeplink, from: source)
        }
    }
}

// MARK: - Internal Deeplink Handlers

extension MusicRouter {
    
}
