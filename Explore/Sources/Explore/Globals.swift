//
//  Globals.swift
//  Explore
//
//  Created by Corbin Montague on 7/2/24.
//

import Core
import Foundation

public struct Globals {
    
    // MARK: - Deeplink Handler
    
    public static var deeplinkHandler: DeeplinkHandling?
    
    // MARK: - Deeplink Router
    
    public static var router: ExploreRouting?
    
    // MARK: - View Builder
    
    public static var viewBuilder: ExploreViewBuilder?
    
    // MARK: - Coordinators
    
    public static var coordinator = ExploreCoordinator()
}
