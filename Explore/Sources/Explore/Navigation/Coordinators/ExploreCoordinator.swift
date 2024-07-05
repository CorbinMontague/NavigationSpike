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
    
}
