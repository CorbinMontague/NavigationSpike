//
//  UINavigationControllerExtensions.swift
//  Core
//
//  Created by Corbin Montague on 7/2/24.
//

import Foundation
import UIKit

/// Don't let Apple automatically disable swipe-to-back when hiding the system back button in the nav bar using `.navigationBarBackButtonHidden(true)`
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
