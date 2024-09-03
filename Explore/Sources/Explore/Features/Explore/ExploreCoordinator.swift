//
//  ExploreCoordinator.swift
//  Explore
//
//  Created by Corbin Montague on 7/5/24.
//

import Combine
import Core
import FlowStacks
import SwiftUI

final public class ExploreCoordinator: NavigationCoordinating {
    
    @Published public var path: FlowPath {
        didSet {
            print("ExploreCoordinator.path: \(path)")
        }
    }
    public var pathPublisher: AnyPublisher<FlowPath, Never> {
        return $path.eraseToAnyPublisher()
    }
    
    public init(path: FlowPath = FlowPath()) {
        self.path = path
    }
}
