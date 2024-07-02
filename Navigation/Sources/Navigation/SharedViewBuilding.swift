//
//  SharedViewBuilding.swift
//  Navigation
//
//  Created by Corbin Montague on 6/30/22.
//

import Foundation
import SwiftUI

public protocol SharedViewBuilding {
    func view(for screen: SharedScreen) -> AnyView
}
