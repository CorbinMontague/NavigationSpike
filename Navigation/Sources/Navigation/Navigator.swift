//
//  Navigator.swift
//  Navigation
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation

//public typealias PathNavigator = Navigator<AnyHashable>
//
///// An `ObservableObject` that helps facilitate navigation within a `NavigationStack`.
//@MainActor
//public class Navigator<Destination>: ObservableObject {
//    
//    public init(path: [Destination] = []) {
//        self.path = path
//    }
//    
//    @Published public var path: [Destination]
//    public var currentDestination: Destination? {
//        path.last
//    }
//    
//    public func push(_ destination: Destination) {
//        path.append(destination)
//    }
//    
//    public func pop(_ numViews: Int) {
//        for _ in 0..<numViews {
//            pop()
//        }
//    }
//    
//    public func pop() {
//        guard !path.isEmpty else { return }
//        
//        path.removeLast()
//    }
//    
//    public func popToRoot() {
//        path = []
//    }
//}
