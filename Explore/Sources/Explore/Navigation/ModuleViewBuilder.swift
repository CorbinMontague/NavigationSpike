//
//  ModuleViewBuilder.swift
//  Explore
//
//  Created by Corbin Montague on 6/30/22.
//

import Foundation
import Navigation
import SwiftUI

public class ModuleViewBuilder {
    
    private var sharedViewBuilder: SharedViewBuilding
    
    init(sharedViewBuilder: SharedViewBuilding) {
        self.sharedViewBuilder = sharedViewBuilder
    }
    
    @ViewBuilder func view(for destination: Destination) -> some View {
        switch destination {
        case .explore:
            ExploreView()
            
        case .sharedDestination(let sharedDestination):
            sharedViewBuilder.view(for: sharedDestination)
        }
    }
}

extension ModuleViewBuilder: ViewBuilding {
    public func externalView(for destination: Destination) -> AnyView {
        return AnyView(view(for: destination))
    }
}
