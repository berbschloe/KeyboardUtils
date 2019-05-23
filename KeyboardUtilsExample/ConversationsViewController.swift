//
//  ViewController.swift
//  KeyboardUtilsExample
//
//  Created by Brandon Erbschloe on 5/23/19.
//  Copyright © 2019 Brandon Erbschloe. All rights reserved.
//

import UIKit
import KeyboardUtils

class ConversationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet
    var tableView: UITableView!

    @IBOutlet
    var searchBar: UISearchBar!

    var conversations: [Conversation] = Conversation.examples

    let keyboardObserver = KeyboardObserver()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        keyboardObserver.updateAdditionalSafeAreaInsets(forViewController: self)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: animated)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.performWithoutAnimation {
            view.endEditing(true)
        }
        keyboardObserver.removeAllObservers()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
            let convsersationViewController = segue.destination as? ConversationViewController {
            convsersationViewController.conversation = conversations[indexPath.row]
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath)
        let conversation = conversations[indexPath.row]

        cell.textLabel!.text = conversation.from
        cell.detailTextLabel!.text = conversation.message

        return cell
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

