//
//  ExploreCoordinator.swift
//  Explore
//
//  Created by Corbin Montague on 7/5/24.
//

import FlowStacks
import SwiftUI

class ExploreCoordinator: ObservableObject {
    static let shared = ExploreCoordinator()
    
    @Published var path = FlowPath()
    
}
