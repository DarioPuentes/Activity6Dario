//
//  Act6.swift
//  Activity6Dario
//
//  Created by Alumno on 25/08/25.
//

import Foundation

struct CharactersResponse: Codable { // Handle double level json from API
    let results: [Character]
}

struct Character: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
