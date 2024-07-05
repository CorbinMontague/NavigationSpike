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
        let navigator = ExploreCoordinator.shared
        let viewModel = ExploreViewModel(navigator: navigator)
        return AnyView(ExploreCoordinatorView(viewModel: viewModel, navigator: navigator))
    }
}
