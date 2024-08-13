//
//  ExploreRouter.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Foundation

/// Concrete `ExploreRouting` that implements routing the user to specific views within `Explore`.
public final class ExploreRouter: ExploreRouting {
    
    // MARK: - Dependencies
    
    private var appCoordinator: AppCoordinating
    private var exploreCoordinator: ExploreCoordinator
    private weak var externalRouter: SharedDeeplinkRouting?
    
    // MARK: - Init
    
    public init(appCoordinator: AppCoordinating,
                exploreCoordinator: ExploreCoordinator = Globals.coordinator,
                externalRouter: SharedDeeplinkRouting? = nil) {
        self.appCoordinator = appCoordinator
        self.exploreCoordinator = exploreCoordinator
        self.externalRouter = externalRouter
    }
    
    // MARK: - ExploreRouting
    
    public func route(to deeplink: ExploreDeeplink, from source: DeeplinkSource) {
        switch deeplink {
        case .explore:
            routeToExplore()
            
        case .external(let sharedDeeplink):
            externalRouter?.route(to: sharedDeeplink, from: source)
        }
    }
}

// MARK: - Internal Deeplink Handlers

extension ExploreRouter {
    
    private func routeToExplore() {
        appCoordinator.selectedTab = .explore
        appCoordinator.dismissAll()
        exploreCoordinator.path.goBackToRoot()
    }
}
