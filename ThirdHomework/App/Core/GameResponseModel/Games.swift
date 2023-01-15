//
//  Game.swift
//  ThirdHomework
//
//  Created by Sefa İbiş on 15.01.2023.
//

import Foundation

struct GamesResponse: Decodable {
    let results: [Result]?
}

struct Result: Decodable {
    let name, released, background_image: String?
    let rating: Double?
    let genres: [Genre]?
}

struct Genre: Decodable {
    let name: String?
}

