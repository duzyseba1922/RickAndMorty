//
//  Episode.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 09/05/2025.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String?
    let air_date: String?
    let episode: String?
    let characters: [String]?
}
