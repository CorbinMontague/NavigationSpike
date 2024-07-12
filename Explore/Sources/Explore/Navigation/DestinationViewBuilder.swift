//
//  DestinationViewBuilder.swift
//  Explore
//
//  Created by Corbin Montague on 6/30/22.
//

import Core
import Foundation
import SwiftUI

public class DestinationViewBuilder {
    private var externalViewBuilder: SharedViewBuilding
    
    public init(externalViewBuilder: SharedViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder func view(at destination: Destination) -> some View {
        switch destination {
        case .explore:
            ViewFactory.makeExploreCoordinatorView()
            
        case .external(let sharedDestination):
            externalViewBuilder.view(at: sharedDestination)
        }
    }
}
