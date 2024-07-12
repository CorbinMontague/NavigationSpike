//
//  FlowPathNavigatorExtensions.swift
//  Core
//
//  Created by Corbin Montague on 7/12/24.
//

import Foundation
import FlowStacks

public extension FlowPathNavigator {
    func isRouteInModal(routeIndex: Int?) -> Bool {
        guard let index = routeIndex, index < routes.count else { return false }
        
        // look at every route on the stack up to the route at the given index and see if any of them were modally presented (sheet or cover)
        var isModal = false
        for i in 0...index {
            let route = routes[i]
            if route.isPresented {
                isModal = true
                break
            }
        }
        return isModal
    }
}
