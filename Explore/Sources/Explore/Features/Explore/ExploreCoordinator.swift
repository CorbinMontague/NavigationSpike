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
    
    @Published public var path: FlowPath {
        didSet {
            print("ExploreCoordinator.path: \(path)")
        }
    }
    public weak var appCoordinator: AppCoordinating?
    
    public init(path: FlowPath = FlowPath(),
                appCoordinator: AppCoordinating? = nil) {
        self.path = path
        self.appCoordinator = appCoordinator
    }
    
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
