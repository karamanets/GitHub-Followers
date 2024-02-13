//
//  Followers.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 26/01/2024.
//

import Foundation

/// Follower Model of user
struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
