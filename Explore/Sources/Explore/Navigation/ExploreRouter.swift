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
    private weak var appCoordinator: AppCoordinating?
    
    public init(appCoordinator: AppCoordinating?) {
        self.appCoordinator = appCoordinator
    }
    
    public func route(to deeplink: Deeplink) {
        switch deeplink {
            // internal routes
        case .explore:
            routeToExplore()
            
            // external routes
        default:
            appCoordinator?.route(to: deeplink)
        }
    }
}

extension ExploreRouter {
    
    private func routeToExplore() {
        print("routeToExplore")
        // select explore tab
        appCoordinator?.selectedTab = .explore
        
        // dismiss all sheets/fullscreencovers
        coordinator.path.dismissAll()
        
        // go back to root view
        coordinator.path.goBackToRoot()
    }
}
