//
//  NavigationCoordinator.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import FlowStacks
import SwiftUI

public protocol NavigationCoordinator: ObservableObject {
    var path: FlowPath { get }
}
