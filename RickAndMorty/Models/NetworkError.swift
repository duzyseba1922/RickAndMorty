//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 09/05/2025.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badResponse
    case badStatus
    case failedToDecodeResponse
}
