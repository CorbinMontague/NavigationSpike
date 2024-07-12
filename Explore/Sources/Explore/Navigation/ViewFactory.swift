//
//  ViewFactory.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import SwiftUI

public struct ViewFactory {
    public static func makeExploreCoordinatorView() -> AnyView {
        let coordinator = ExploreCoordinator.shared
        let viewModel = ExploreViewModel(coordinator: coordinator)
        return AnyView(ExploreCoordinatorView(viewModel: viewModel, coordinator: coordinator))
    }
}
