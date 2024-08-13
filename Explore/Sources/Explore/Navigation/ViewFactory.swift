//
//  ViewFactory.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import SwiftUI

public struct ViewFactory {
    
    // MARK: - Internal Views
    
    static func makeExploreCoordinatorView() -> ExploreCoordinatorView {
        let viewModel = ViewModelFactory.makeExploreViewModel()
        return ExploreCoordinatorView(coordinator: Globals.coordinator, viewModel: viewModel)
    }
    
    // MARK: - Cross-Module Views
    
    public static func makeExploreCoordinatorAnyView() -> AnyView {
        let view = makeExploreCoordinatorView()
        return AnyView(view)
    }
}
