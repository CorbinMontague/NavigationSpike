//
//  AppCoordinating.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import Foundation
import SwiftUI

public enum Tab: Hashable {
    case explore
    case playlists
}

public protocol AppCoordinating: AnyObject {
    var selectedTab: Tab { get set }
    
    func route(to destination: SharedDestination)
}
