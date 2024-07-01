//
//  ViewBuilding.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import SwiftUI

public protocol ViewBuilding {
    func externalView(for destination: Destination) -> AnyView
}
