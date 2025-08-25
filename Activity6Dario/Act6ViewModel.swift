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
    
    var errorDescription: String? {
        switch self {
        case .internet:
            return "No connection. Please try again."
        case .apiFails:
            return "Error 404: API not found"
        case .decodingFail:
            return "Decoding error"
        }
    }
}

@MainActor
@Observable
class Act6ViewModel: ObservableObject {
    var arrCharacter = [Character]()
    var errorMessage: String?
    
    func getPhotosCharacter() async {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.apiFails
            }
            
            let decoded = try JSONDecoder().decode(CharactersResponse.self, from: data)
            self.arrCharacter = decoded.results
            self.errorMessage = nil
        }
        catch let urlError as URLError where urlError.code == .notConnectedToInternet {
            self.errorMessage = NetworkError.internet.errorDescription
        }
        catch is DecodingError {
            self.errorMessage = NetworkError.decodingFail.errorDescription
        }
        catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
