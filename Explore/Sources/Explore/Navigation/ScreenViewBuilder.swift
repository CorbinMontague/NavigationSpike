//
//  ScreenViewBuilder.swift
//  Explore
//
//  Created by Corbin Montague on 6/30/22.
//

import Core
import Foundation
import SwiftUI

public class ScreenViewBuilder: ModuleScreenViewBuilding {
    public typealias ScreenCase = Screen
    
    private var externalViewBuilder: SharedScreenViewBuilding
    
    public init(externalViewBuilder: SharedScreenViewBuilding) {
        self.externalViewBuilder = externalViewBuilder
    }
    
    @ViewBuilder public func view(for screen: Screen) -> some View {
        switch screen {
        case .explore:
            ViewFactory.makeExploreCoordinatorView()
            
        case .external(let sharedScreen):
            externalViewBuilder.view(for: sharedScreen)
        }
    }
}
