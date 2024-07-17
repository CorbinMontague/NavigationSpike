//
//  ScreenViewBuilding.swift
//  Core
//
//  Created by Corbin Montague on 6/30/22.
//

import Foundation
import SwiftUI

/// Builds Views for cross-module SharedScreens.
public protocol SharedScreenViewBuilding {
    
    /// Returns the `View` associated with the provided `SharedScreen`.
    /// - Parameter screen: The `SharedScreen` whose `View` we want.
    /// - Returns: The `View` associated with the `SharedScreen`.
    func view(for screen: SharedScreen) -> AnyView
}

/// Builds Views for Experience Module Screens.
public protocol ModuleScreenViewBuilding<ScreenCase> {
    associatedtype ScreenCase where ScreenCase: Hashable
    associatedtype ScreenView: View
    
    /// Returns the `View` associated with the provided `ScreenCase`.
    /// - Parameter screen: The `ScreenCase` whose `View` we want.
    /// - Returns: The `View` associated with the `ScreenCase`.
    func view(for screen: ScreenCase) -> ScreenView
}
