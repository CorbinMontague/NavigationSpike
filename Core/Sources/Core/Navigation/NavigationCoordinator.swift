//
//  NavigationCoordinator.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import FlowStacks
import SwiftUI

// Allows us to mock coordinators in unit tests.
public protocol NavigationCoordinator: ObservableObject {
    var path: FlowPath { get }
}
