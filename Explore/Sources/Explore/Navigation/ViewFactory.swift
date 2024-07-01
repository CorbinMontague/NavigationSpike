//
//  ViewFactory.swift
//  Explore
//
//  Created by Corbin Montague on 7/1/24.
//

import Foundation
import SwiftUI

public struct ViewFactory {
    static public func makeExploreView() -> AnyView {
        return AnyView(ExploreView())
    }
}
