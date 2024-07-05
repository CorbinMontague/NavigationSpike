//
//  SharedViewRouting.swift
//  Core
//
//  Created by Corbin Montague on 7/5/24.
//

import Foundation
import SwiftUI

public protocol SharedViewRouting {
    func route(to destination: SharedDestination) async
}
