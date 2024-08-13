//
//  ViewFactory.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 8/13/24.
//

import Foundation

struct ViewFactory {
    
    static func makeDevToolsView() -> DevToolsView {
        let viewModel = ViewModelFactory.makeDevToolsViewModel()
        return DevToolsView(viewModel: viewModel)
    }
}
