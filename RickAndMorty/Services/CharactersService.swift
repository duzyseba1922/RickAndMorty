//
//  CharactersService.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 09/05/2025.
//

import Foundation

class CharactersService {

    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }

    func fetchData() async -> [Character]? {
        guard let endpoint = webService.endpoints?.characters,
              let url = URL(string: endpoint) else { return nil }
        let urlRequest = URLRequest(url: url)
        guard let data: CharactersResults = await WebService().downloadData(for: urlRequest) else { return nil }
        
        return data.results
    }
}
