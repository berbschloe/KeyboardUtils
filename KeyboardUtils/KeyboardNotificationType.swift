//
//  KeyboardNotificationType.swift
//  KeyboardUtils
//
//  Created by Brandon Erbschloe on 5/23/19.
//  Copyright © 2019 Brandon Erbschloe. All rights reserved.
//

import UIKit

public enum KeyboardNotificationType {
    
    case willShow
    case didShow

    case willChangeFrame
    case didChangeFrame

    case willHide
    case didHide

    var notificationName: Notification.Name {
        
        switch self {
        case .willShow: return UIResponder.keyboardWillShowNotification
        case .didShow: return UIResponder.keyboardDidShowNotification
        case .willChangeFrame: return UIResponder.keyboardWillChangeFrameNotification
        case .didChangeFrame: return UIResponder.keyboardDidChangeFrameNotification
        case .willHide: return UIResponder.keyboardWillHideNotification
        case .didHide: return UIResponder.keyboardDidHideNotification
        }
    }
}
