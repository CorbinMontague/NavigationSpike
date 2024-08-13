//
//  NavigationCoordinating.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import FlowStacks
import SwiftUI

/// Stores a `FlowStack`'s navigation state.
public protocol NavigationCoordinating: ObservableObject {
    
    /// Represents the state of a `FlowStack` (a wrapper around SwiftUI's `NavigationStack`).
    var path: FlowPath { get set }
}
