//
//  NavigationCoordinator.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import FlowStacks
import SwiftUI

/// Stores a FlowStack's navigation state and supports cross-module navigation.
///
/// This protocol allows us to mock coordinators in unit tests.
public protocol NavigationCoordinator: ObservableObject {
    var appCoordinator: AppCoordinating? { get }
    var path: FlowPath { get }
    
    func navigate(to deeplink: Deeplink)
}

// Gives each NavigationCoordinator a default navigate(to:) implementation in-case it doesn't need to define it's own.
// This is because outside of NavigationCoordinators associated with root tab views, most other NavigationCoordinators won't
// need to define/support their own deeplink navigation logic.
extension NavigationCoordinator {
    public func navigate(to deeplink: Deeplink) {
        appCoordinator?.navigate(to: deeplink)
    }
}
