//
//  ViewModelFactory.swift
//
//
//  Created by Corbin Montague on 8/13/24.
//

import Foundation
import SwiftUI

struct ViewModelFactory {
    
    static func makeExploreViewModel() -> ExploreViewModel {
        return ExploreViewModel(coordinator: Globals.coordinator)
    }
}
