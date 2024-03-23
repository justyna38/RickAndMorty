//
//  File.swift
//  RickEtMortyAPI
//
//  Created by Justyna Warzecha on 22/03/2024.
//

import Foundation

struct Result: Decodable {
    let results: [Character]
}


struct Character: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var image: String
    var location: Location
}

struct Location: Decodable {
    let name: String
    let url: String
}
