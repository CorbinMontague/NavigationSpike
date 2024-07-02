//
//  SharedViewBuilding.swift
//  Core
//import Core
//  Created by Corbin Montague on 6/30/22.
//

import Foundation
import SwiftUI

public protocol SharedViewBuilding {
    func view(at destination: SharedDestination) -> AnyView
}

//public protocol DestinationViewBuilding {
//    associatedtype DestinationType where DestinationType: Hashable
//    
//    func view(at destination: DestinationType) -> AnyView
//}
