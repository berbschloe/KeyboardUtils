//
//  UIViewController+KeyboardUtils.swift
//  KeyboardUtils
//
//  Created by Brandon Erbschloe on 5/23/19.
//  Copyright © 2019 Brandon Erbschloe. All rights reserved.
//

import UIKit

extension UIViewController {

    @available(iOS 11.0, *)
    public func updateAdditionalSafeAreaInsets(withInfo info: KeyboardNotificationInfo, animated: Bool = false) {
        
        if animated {
            UIView.performWithoutAnimation {
                view.layoutIfNeeded()
            }
        }

        var bottom = view.frame.height - info.endFrame(in: view).minY

        if let tabBar = tabBarController?.tabBar, tabBar.isTranslucent {
            bottom -= tabBar.frame.height
        }

        additionalSafeAreaInsets.bottom = bottom

        if animated {
            view.layoutIfNeeded()
        }
    }
}
