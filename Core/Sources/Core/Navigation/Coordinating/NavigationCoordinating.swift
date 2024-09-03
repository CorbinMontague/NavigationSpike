//
//  NavigationCoordinating.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import Combine
import FlowStacks
import SwiftUI

/// Stores a `FlowStack`'s navigation state.
public protocol NavigationCoordinating: ObservableObject {
    
    /// Represents the `FlowStack` state (a wrapper around SwiftUI's `NavigationStack`).
    var path: FlowPath { get set }
    
    /// Publisher for listening to `FlowPath` changes.
    var pathPublisher: AnyPublisher<FlowPath, Never> { get }
}
