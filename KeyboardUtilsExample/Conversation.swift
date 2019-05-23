//
//  Conversation.swift
//  KeyboardUtilsExample
//
//  Created by Brandon Erbschloe on 5/23/19.
//  Copyright © 2019 Brandon Erbschloe. All rights reserved.
//

import Foundation

struct Conversation: Equatable {

    var from: String
    var message: String
}

extension Conversation {
    
    static let examples: [Conversation] = [
        Conversation(from: "Lacey", message: "How goes things?"),
        Conversation(from: "Bran", message: "Get back to work!"),
        Conversation(from: "Butch", message: "Lets get some confefe?!"),
        Conversation(from: "Jessie", message: "Rory doesn't like me so I'm just going to run away the L.A. and see my dad."),
        Conversation(from: "Rory", message: "Lets get some day old chinese and watch nature documentaries with my mom."),

        Conversation(from: "Lacey", message: "How goes things?"),
        Conversation(from: "Bran", message: "Get back to work!"),
        Conversation(from: "Butch", message: "Lets get some confefe?!"),
        Conversation(from: "Jessie", message: "Rory doesn't like me so I'm just going to run away the L.A. and see my dad."),
        Conversation(from: "Rory", message: "Lets get some day old chinese and watch nature documentaries with my mom."),

        Conversation(from: "Lacey", message: "How goes things?"),
        Conversation(from: "Bran", message: "Get back to work!"),
        Conversation(from: "Butch", message: "Lets get some confefe?!"),
        Conversation(from: "Jessie", message: "Rory doesn't like me so I'm just going to run away the L.A. and see my dad."),
        Conversation(from: "Rory", message: "Lets get some day old chinese and watch nature documentaries with my mom.")
    ]
}
