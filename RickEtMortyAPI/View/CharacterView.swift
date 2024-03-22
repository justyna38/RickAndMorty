//
//  CharacterView.swift
//  RickEtMortyAPI
//
//  Created by Justyna Warzecha on 22/03/2024.
//

import SwiftUI

struct CharacterView: View {
    
    @ObservedObject var viewModel = CharacterViewModel()
    var body: some View {
        ScrollView{
            VStack{
                ForEach(viewModel.people, id: \.id) { character in
                    HStack{
                        Image(character.image)
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        Text(character.name)
                    }
                }
            }
            
        }.onAppear(){
            viewModel.fetchCharacters()
        }
    }
}

#Preview {
    CharacterView()
}
