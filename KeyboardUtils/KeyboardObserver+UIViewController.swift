//
//  KeyboardObserver+UIViewController.swift
//  KeyboardUtils
//
//  Created by Brandon Erbschloe on 5/23/19.
//  Copyright © 2019 Brandon Erbschloe. All rights reserved.
//

import UIKit

extension KeyboardObserver {

    @available(iOS 11.0, *)
    public func updateAdditionalSafeAreaInsets(forViewController viewController: UIViewController, animated: Bool = false) {
        addObserver(forType: .willChangeFrame) { [weak viewController] info in
            guard let viewController = viewController else { return }

            if animated {
                UIView.performWithoutAnimation {
                    viewController.view.layoutIfNeeded()
                }
            }

            var bottom = viewController.view.frame.height - info.endFrame(in: viewController.view).minY

            if let tabBar = viewController.tabBarController?.tabBar, tabBar.isTranslucent {
                bottom -= tabBar.frame.height
            }

            viewController.additionalSafeAreaInsets.bottom = bottom

            if animated {
                viewController.view.layoutIfNeeded()
            }
        }
    }
}
