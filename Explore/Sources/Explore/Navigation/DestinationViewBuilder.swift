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
    
    private var externalViewBuilder: SharedViewBuilding
    
    public init(externalViewBuilder: SharedViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder func view(for destination: Destination) -> some View {
        switch destination {
        case .explore:
            ViewFactory.makeExploreView()
            
        case .external(let sharedDestination):
            externalViewBuilder.view(for: sharedDestination)
        }
    }
}
