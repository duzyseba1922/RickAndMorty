//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 09/05/2025.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    
    let webService = WebService()

    var body: some Scene {
        WindowGroup {
            CharactersListView(webService: webService)
        }
    }
}
