//
//  KeyboardLayoutGuide.swift
//  KeyboardUtils
//
//  Created by Brandon Erbschloe on 5/22/19.
//  Copyright © 2019 Brandon Erbschloe. All rights reserved.
//

import Foundation

open class KeyboardLayoutGuide: UILayoutGuide {

    private let observer: KeyboardObserver

    private var heightConstraint: NSLayoutConstraint!
    private var bottomConstraint: NSLayoutConstraint!
    private var leftConstraint: NSLayoutConstraint!
    private var rightConstraint: NSLayoutConstraint!

    private var constraints: [NSLayoutConstraint] {
        return [heightConstraint, bottomConstraint, leftConstraint, rightConstraint]
    }

    public init(notificationCenter: NotificationCenter = .default) {
        observer = KeyboardObserver(notificationCenter: notificationCenter)

        super.init()

        observer.addObserver(forType: .willChangeFrame) { [weak self] info in
            guard let self = self, let owningView = self.owningView else { return }

            UIView.performWithoutAnimation {
                owningView.layoutIfNeeded()
            }

            let constant = owningView.frame.height - info.endFrame(in: owningView).minY
            let guardedConstant = min(max(constant, 0), owningView.frame.height)
            self.heightConstraint.constant = guardedConstant

            owningView.layoutIfNeeded()
        }
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override var owningView: UIView? {
        didSet {
            guard owningView != oldValue else { return }

            if oldValue != nil {
                NSLayoutConstraint.deactivate(constraints)
            }

            guard let owningView = owningView else { return }

            heightConstraint = heightAnchor.constraint(equalToConstant: 0)
            bottomConstraint = bottomAnchor.constraint(equalTo: owningView.bottomAnchor)
            leftConstraint = leftAnchor.constraint(equalTo: owningView.leftAnchor)
            rightConstraint = rightAnchor.constraint(equalTo: owningView.rightAnchor)

            NSLayoutConstraint.activate(constraints)
        }
    }
}

extension UIView {
    
    private static var keyboardLayoutGuideKey: UInt = 0

    public var keyboardLayoutGuide: KeyboardLayoutGuide {
        if let layoutGuide = objc_getAssociatedObject(self, &UIView.keyboardLayoutGuideKey) as? KeyboardLayoutGuide {
            return layoutGuide
        }

        let layoutGuide = KeyboardLayoutGuide()
        addLayoutGuide(layoutGuide)
        objc_setAssociatedObject(self, &UIView.keyboardLayoutGuideKey, layoutGuide, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        return layoutGuide
    }
}
