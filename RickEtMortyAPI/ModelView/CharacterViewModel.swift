//
//  File.swift
//  RickEtMortyAPI
//
//  Created by Justyna Warzecha on 22/03/2024.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var people: [Character] = []
    @Published var location: String = ""
    
    func fetchCharacters(){
        let url = URL(string: "https://rickandmortyapi.com/api/character/")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(Result.self, from: data)
                    DispatchQueue.main.async {
                        self.people = decodedData.results
                    }
                } catch{
                    print("Erreur: \(error)")
                }
            }
            
        }.resume()
    }
    
    
    
    
}
