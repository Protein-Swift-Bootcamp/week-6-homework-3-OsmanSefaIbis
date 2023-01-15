//
//  Game.swift
//  ThirdHomework
//
//  Created by Sefa İbiş on 15.01.2023.
//

import Foundation

struct Games: Decodable {
    let results: [Result]?
}

struct Result: Codable {
    let name, released, backgroundImage: String?
    let rating: Double?
    let genres: [Genre]?
}

struct Genre: Codable {
    let name: String?
}

