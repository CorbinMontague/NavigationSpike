//
//  NavigationCoordinator.swift
//  Navigation
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

/// An `ObservableObject` that helps facilitate navigation within a `NavigationStack`.
public protocol NavigationCoordinator: ObservableObject {
    associatedtype DestinationType where DestinationType: Hashable
    
    var path: [DestinationType] { get set }
    var currentDestination: DestinationType? { get }
    
    func push(_ destination: DestinationType)
    func pop()
    func pop(_ numViews: Int)
    func popToRoot()
}

extension NavigationCoordinator {
    public var currentDestination: DestinationType? {
        path.last
    }
    
    public func push(_ destination: DestinationType) {
        path.append(destination)
    }
    
    public func pop(_ numViews: Int) {
        for _ in 0..<numViews {
            pop()
        }
    }
    
    public func pop() {
        guard !path.isEmpty else { return }
        
        path.removeLast()
    }
    
    public func popToRoot() {
        path = []
    }
}
