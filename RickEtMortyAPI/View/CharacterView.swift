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
        NavigationStack{
            ZStack{
                Color(.black)
                    .ignoresSafeArea()
                ScrollView{
                    Text("Rick and Morty characters")
                        .foregroundStyle(.green)
                        .font(.title)
                        .bold()
                    VStack(alignment: .leading){
                        ForEach(viewModel.people, id: \.id) { character in
                            NavigationLink(destination: DetailViewCharacter(character: character)){
                                HStack{
                                    if let url = URL(string: character.image) {
                                        AsyncImage(url:url){ response in
                                            switch response{
                                            case .success(let image):
                                                image.resizable().frame(width: 60, height: 60).clipShape(RoundedRectangle(cornerRadius: 30))
                                            case .failure(_), .empty:
                                                Image(systemName: "photo.fill").resizable().frame(width: 50, height: 50)
                                            @unknown default:
                                                ProgressView()
                                                
                                            }
                                        }
                                    }else {
                                        Image(systemName: "photo.fill").resizable().frame(width: 50, height: 50)
                                    }
                                    VStack(alignment: .leading){
                                        Text(character.name)
                                            .font(.title3)
                                            .bold()
                                        Text(character.species)
                                    }
                                    .padding()
                                    .foregroundStyle(.green)
                                    Spacer()
                                    Text(">")
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .bold()
                                        .foregroundStyle(.green)
                                }
                            }
                        }
                    }
                    .padding()
                }
                
            }.onAppear(){
                viewModel.fetchCharacters()
            }
        }
    }
}

struct DetailViewCharacter: View{
    var character: Character
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            ScrollView{
                Text("\(character.name)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.green)
                VStack(alignment: .leading){
                    if let url = URL(string: character.image) {
                        AsyncImage(url:url){ response in
                            switch response{
                            case .success(let image):
                                image.resizable().scaledToFit().frame(width: 300, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(lineWidth: 2).foregroundColor(Color.green))
                            case .failure(_), .empty:
                                Image(systemName: "photo.fill").resizable().frame(width: 50, height: 50)
                            @unknown default:
                                ProgressView()
                                
                            }
                        }
                    }else {
                        Image(systemName: "photo.fill").resizable().frame(width: 50, height: 50)
                    }
//                    VStack(alignment: .leading){
                        HStack {
                            Image(systemName: character.status == "Dead" ? "multiply.circle.fill" : "heart.fill")
                                .foregroundColor(character.status == "Dead" ? .red : .green)
                            Text(character.status)
                                .foregroundColor(.green)
                        }
                        .font(.title3)
                        .padding(.bottom, 10)
                      
                       
                        HStack {
                            Image(systemName: "house.fill")
                            Text(character.location.name)
                        }
                        .font(.title3)
                        .foregroundColor(.green)

//                    }
//                    .padding(.trailing, 190)
//                    .padding()
//                    .background(.blue)
                    
                }
                //.padding()
                .padding(.top, 150)
            }
        }
        
        
    }
}

#Preview {
    CharacterView()
}
