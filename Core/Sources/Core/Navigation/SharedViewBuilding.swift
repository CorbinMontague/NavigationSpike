//
//  SharedViewBuilding.swift
//  Core
//
//  Created by Corbin Montague on 6/30/22.
//

import Foundation
import SwiftUI

/// Builds cross-module `Views` for the provided `SharedScreen`.
public protocol SharedViewBuilding {
    func view(for screen: SharedScreen) -> AnyView
}
