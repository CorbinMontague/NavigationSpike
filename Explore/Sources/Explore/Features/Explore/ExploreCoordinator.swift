//
//  ExploreCoordinator.swift
//  Explore
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import FlowStacks
import SwiftUI

public class ExploreCoordinator: NavigationCoordinator {
    public static let shared = ExploreCoordinator()
    
    @Published public var path = FlowPath()
    public weak var appCoordinator: AppCoordinating?
    
    public func navigate(to deeplink: Deeplink) {
        switch deeplink {
        case .explore:
            navigateToExplore()
        default:
            appCoordinator?.navigate(to: deeplink)
        }
    }
}

extension ExploreCoordinator {
    
    private func navigateToExplore() {
        // select explore tab
        appCoordinator?.selectedTab = .explore
        
        // dismiss all sheets/fullscreencovers
        path.dismissAll()
        
        // go back to root view
        path.goBackToRoot()
    }
}
