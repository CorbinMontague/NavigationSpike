//
//  Globals.swift
//  Explore
//
//  Created by Corbin Montague on 7/2/24.
//

import Foundation

public struct Globals {
    public static let shared = Globals()
    
    public static var coordinator = ExploreCoordinator.shared
    public static var viewBuilder: ScreenViewBuilder?
}
