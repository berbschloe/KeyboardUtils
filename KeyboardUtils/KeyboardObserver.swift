//
//  KeyboardObserver.swift
//  KeyboardUtils
//
//  Created by Brandon Erbschloe on 5/22/19.
//  Copyright © 2019 Brandon Erbschloe. All rights reserved.
//

import Foundation

public typealias KeyboardNotificationHandler = (KeyboardNotificationInfo) -> Void

open class KeyboardObserver {

    static let shared = KeyboardObserver()

    private let notificationCenter: NotificationCenter
    private let queue: OperationQueue?

    private var tokens: [Any] = []
    private var handlersByType: [KeyboardNotificationType: [KeyboardNotificationHandler]] = [:]

    public init(notificationCenter: NotificationCenter = .default, queue: OperationQueue? = nil) {
        self.notificationCenter = notificationCenter
        self.queue = queue
    }

    open func addObserver(forType type: KeyboardNotificationType, handler: @escaping KeyboardNotificationHandler) {

        let handlers = handlersByType[type, default: []]
        handlersByType[type] = handlers + [handler]

        guard handlers.isEmpty else {
            return
        }

        let token = notificationCenter.addObserver(forName: type.notificationName, object: nil, queue: queue) { [unowned self] in
            let info = KeyboardNotificationInfo(type: type, notification: $0)
            self.handlersByType[type]?.forEach { $0(info) }
        }

        tokens.append(token)
    }

    open func removeAllObservers() {
        handlersByType.removeAll()

        tokens.forEach { notificationCenter.removeObserver($0) }
        tokens.removeAll()
    }

    deinit {
        tokens.forEach { notificationCenter.removeObserver($0) }
    }
}
