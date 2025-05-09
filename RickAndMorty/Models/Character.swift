//
//  Character.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 09/05/2025.
//

import Foundation

struct CharactersResults: Codable {
    let info: Info?
    let results: [Character]?
}

struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct Character: Codable, Identifiable {
    var id: Int?
    let name: String?
    let status: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
    let episode: [String]?
}

struct Origin: Codable {
    let name: String?
    let url: String?
}

struct Location: Codable {
    let name: String?
    let url: String?
}
