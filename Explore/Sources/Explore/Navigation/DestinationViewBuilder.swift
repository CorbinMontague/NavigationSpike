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
    
    @ViewBuilder func view(for screen: Screen) -> some View {
        switch screen {
        case .explore:
            ViewFactory.makeExploreCoordinator()
            
        case .external(let sharedScreen):
            externalViewBuilder.view(for: sharedScreen)
        }
    }
}
