//
//  ExploreCoordinator.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import Navigation

final class ExploreCoordinator: NavigationCoordinator {
    typealias DestinationType = Destination
    
    @Published var path: [DestinationType]
    
    // MARK: - Init
    
    init() {
        path = []
    }
}
