//
//  Act6ViewModel.swift
//  Activity6Dario
//
//  Created by Alumno on 25/08/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case internet
    case apiFails
    case decodingFail
    
    var errorDescription: String? { // Define error type
        switch self {
        case .internet:
            return "No connection. Please try again." // No internet error message
        case .apiFails:
            return "Error 404: API not found" // Invalid URL message
        case .decodingFail:
            return "Decoding error" // App error
        }
    }
}

@MainActor
@Observable
class Act6ViewModel: ObservableObject {
    var arrCharacter = [Character]()
    var errorMessage: String?
    
    func getPhotosCharacter() async {
        
        // GET API
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        // Error handler
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.apiFails // "Error 404" message
            }
            
            let decoded = try JSONDecoder().decode(CharactersResponse.self, from: data)
            self.arrCharacter = decoded.results
            self.errorMessage = nil
        }
        catch let urlError as URLError where urlError.code == .notConnectedToInternet {
            self.errorMessage = NetworkError.internet.errorDescription // "No internet" messsage
        }
        catch is DecodingError {
            self.errorMessage = NetworkError.decodingFail.errorDescription // "Decoding error" message
        }
        catch {
            self.errorMessage = error.localizedDescription // Mantain error message
        }
    }
}
