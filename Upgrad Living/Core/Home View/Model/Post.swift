//
//  Post.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 25/04/23.
//

import SwiftUI

struct Post: Identifiable, Equatable{
    var id = UUID().uuidString
    var postImage: String
    var title: String
    var description: String
    var starRaiting: Int
}

var posts = [
    Post(postImage: "Post1", title: "Black Widow", description: "Natasha Romanoff, aka Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past aries.", starRaiting: 4),
    
    Post(postImage: "Post2", title: "Loki", description: "Loki, the God of Mischief, steps out of his brother's shadow to embark on an adventure that takes place after the events of Avengers: Endgame", starRaiting: 5),
    
    Post(postImage: "Post3", title: "Loki", description: "Living idealized suburban lives, super-powered beings wanda and vision begin to suspect that everything is not as it seems", starRaiting: 4)
]
