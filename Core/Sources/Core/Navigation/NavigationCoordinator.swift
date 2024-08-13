//
//  NavigationCoordinator.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import FlowStacks
import SwiftUI

/// Stores a `FlowStack`'s navigation state.
public protocol NavigationCoordinator: AnyObject {
    
    /// Represents this `NavigationCoordinator`'s `NavigationStack` state.
    var path: FlowPath { get set }
}
