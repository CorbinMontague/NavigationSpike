//
//  ExploreCoordinator.swift
//  Explore
//
//  Created by Corbin Montague on 7/5/24.
//

import Core
import FlowStacks
import SwiftUI

class ExploreCoordinator: NavigationCoordinator {
    static let shared = ExploreCoordinator()
    
    @Published var path = FlowPath()
    
}
