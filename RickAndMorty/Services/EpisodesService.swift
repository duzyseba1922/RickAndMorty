//
//  EpisodesService.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 09/05/2025.
//

import Foundation

class EpisodesService {

    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }

    func fetchData(for episode: Int) async -> Episode? {
        guard let endpoint = webService.endpoints?.episodes,
              let url = URL(string: endpoint + "/\(episode)") else { return nil }
        let urlRequest = URLRequest(url: url)
        guard let data: Episode = await WebService().downloadData(for: urlRequest) else { return nil }
        
        return data
    }
}
