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
        return AnyView(ExploreCoordinatorView())
    }
}
