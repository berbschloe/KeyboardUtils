//
//  KeyboardNotificationInfo.swift
//  KeyboardUtils
//
//  Created by Brandon Erbschloe on 5/22/19.
//  Copyright © 2019 Brandon Erbschloe. All rights reserved.
//

import Foundation

public struct KeyboardNotificationInfo {

    public let type: KeyboardNotificationType

    public let isLocal: Bool

    public let beginFrame: CGRect
    public let endFrame: CGRect

    public let animationDurration: TimeInterval

    public let animationCurve: UIView.AnimationCurve

    public func beginFrame(in view: UIView) -> CGRect {
        return view.convert(beginFrame, from: nil)
    }

    public func endFrame(in view: UIView) -> CGRect {

        return view.convert(endFrame, from: nil)
    }

    public func animateAlong(animations: (() -> Void)) {
        animateAlong(animations: animations, completion: nil)
    }

    private func animateAlong(animations: (() -> Void), completion: ((_ finished: Bool) -> Void)?) {

        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(animationDurration)
        UIView.setAnimationCurve(animationCurve)
        UIView.setAnimationBeginsFromCurrentState(true)

        animations()

        UIView.commitAnimations()
    }
}

extension KeyboardNotificationInfo {

    public init(type: KeyboardNotificationType, notification: Notification) {

        let userInfo = notification.userInfo ?? [:]

        self.init(
            type: type,
            isLocal: userInfo[UIResponder.keyboardIsLocalUserInfoKey] as? Bool ?? false,
            beginFrame: userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect ?? .zero,
            endFrame: userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero,
            animationDurration: userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0,
            animationCurve: (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int).flatMap(UIView.AnimationCurve.init(rawValue:)) ?? .easeInOut
        )
    }
}
