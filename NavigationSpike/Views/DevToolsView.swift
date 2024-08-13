//
//  DevToolsView.swift
//  NavigationSpike
//
//  Created by Corbin Montague on 8/13/24.
//

import Core
import Explore
import SwiftUI

struct DevToolsView: View {
    
    @StateObject var viewModel: DevToolsViewModel
    
    var body: some View {
        Text("This could be a view with options to support internal development and QA")
    }
}

class DevToolsViewModel: ObservableObject {
    init() { }
}
