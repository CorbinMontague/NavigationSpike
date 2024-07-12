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
    var path: FlowPath { get }
    
    func navigate(to deeplink: Deeplink)
}
