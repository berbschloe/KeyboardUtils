//
//  ConversationViewController.swift
//  KeyboardUtilsExample
//
//  Created by Brandon Erbschloe on 5/23/19.
//  Copyright © 2019 Brandon Erbschloe. All rights reserved.
//

import UIKit
import KeyboardUtils

class ConversationViewController: UIViewController {

    var conversation: Conversation! {
        didSet {
            title = conversation.from
        }
    }

    @IBOutlet
    var messageBox: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let keyboardView = UIView()
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        keyboardView.backgroundColor = .red
        view.addSubview(keyboardView)

        NSLayoutConstraint.activate([
            messageBox.bottomAnchor.constraint(lessThanOrEqualTo: view.keyboardLayoutGuide.topAnchor),

            keyboardView.leftAnchor.constraint(equalTo: view.keyboardLayoutGuide.leftAnchor),
            keyboardView.rightAnchor.constraint(equalTo: view.keyboardLayoutGuide.rightAnchor),
            keyboardView.topAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.bottomAnchor),
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        messageBox.subviews.first!.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    @IBAction
    func backgroundPressed() {
        view.endEditing(true)
    }
}
