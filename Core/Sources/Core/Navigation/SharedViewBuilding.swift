//
//  SharedViewBuilding.swift
//  Core
//
//  Created by Corbin Montague on 6/30/22.
//

import Foundation
import SwiftUI

/// Builds Views for SharedScreens
public protocol SharedViewBuilding {
    
    /// Returns the `View` associated with the provided `SharedScreen`.
    /// - Parameter screen: The `SharedScreen` whose `View` we want.
    /// - Returns: The `View` associated with the `SharedScreen`.
    func view(for screen: SharedScreen) -> AnyView
}
