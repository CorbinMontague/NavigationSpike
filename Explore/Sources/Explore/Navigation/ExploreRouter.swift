//
//  ExploreRouter.swift
//  Explore
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import Foundation

public final class ExploreRouter {
    
    private var coordinator = ExploreCoordinator.shared
    private var appCoordinator: AppCoordinating
    
    public init(appCoordinator: AppCoordinating) {
        self.appCoordinator = appCoordinator
    }
    
    public func route(to destination: SharedDestination) {
        switch destination {
            // internal routes
        case .explore:
            routeToExplore()
            
            // external routes
        default:
            appCoordinator.route(to: destination)
        }
    }
}

extension ExploreRouter {
    
    private func commonInternalRouteHandler() {
        // select explore tab
        appCoordinator.selectedTab = .explore
        
        // dismiss all sheets/fullscreencovers
        coordinator.path.dismissAll()
    }
    
    private func routeToExplore() {
        commonInternalRouteHandler()
        coordinator.path.goBackToRoot()
    }
}
