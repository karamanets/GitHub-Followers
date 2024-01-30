//
//  GFError.swift
//  GitHubFollowers
//
//  Created by Alex Karamanets on 30/01/2024.
//

import Foundation

enum GFError: String, Error {
    case invalidResponse   = "Invalid response from server.\nPlease try again."
    case invalidData       = "Invalid Data from server.\nPlease try again."
    case invalidUserName   = "This username invalid.\nPlease try again."
    case unableToComplete  = "Please check you're internet connection."
}
