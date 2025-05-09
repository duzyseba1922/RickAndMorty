//
//  WebService.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 09/05/2025.
//

import Foundation

final class WebService: Codable {
    
    private enum Constants {
        static let baseEndpoint = "https://rickandmortyapi.com/api"
    }
    
    var endpoints: Endpoints?
    
    func getEndpoints() async {
        guard let url = URL(string: Constants.baseEndpoint) else { return }
        let urlRequest = URLRequest(url: url)
        guard let endpoints: Endpoints = await downloadData(for: urlRequest) else { return }
        
        self.endpoints = endpoints
    }

    func downloadData<T: Codable>(for request: URLRequest) async -> T? {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            
            return decodedResponse

        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }
        
        return nil
    }
}
