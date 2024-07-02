//
//  DestinationViewBuilder.swift
//  Explore
//
//  Created by Corbin Montague on 6/30/22.
//

import Foundation
import Navigation
import SwiftUI

public class DestinationViewBuilder: ObservableObject {
//    public typealias DestinationType = Destination
    
    private var externalViewBuilder: SharedViewBuilding
    
    public init(externalViewBuilder: SharedViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder func view(at destination: Destination) -> some View {
        switch destination {
        case .explore:
            ViewFactory.makeExploreCoordinator()
            
        case .external(let sharedDestination):
            externalViewBuilder.view(at: sharedDestination)
        }
    }
}