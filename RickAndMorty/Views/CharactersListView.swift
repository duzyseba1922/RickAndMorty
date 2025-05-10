//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Sebastian Niestój on 09/05/2025.
//

import SwiftUI

struct CharactersListView: View {
    
    let webService: WebService

    @State private var isListPresent = false
    @State private var characters: [Character] = []
    
    init(webService: WebService) {
        self.webService = webService
        
        if let font = UIFont(name: "Get Schwifty", size: 40) {
            UINavigationBar.appearance().largeTitleTextAttributes = [
                .font : font
            ]
        }
    }

    var body: some View {
        VStack {
            ZStack {
                NavigationView {
                    List {
                        ForEach(characters) { character in
                            NavigationLink {
                                CharacterDetailsView()
                            } label: {
                                HStack(spacing: 20) {
                                    
                                    CachedAsyncImage(
                                        url: URL(string: character.image!),
                                        urlCache: .shared,
                                        content: { avatar in
                                            avatar.resizable()
                                                .frame(maxWidth: 100,
                                                       maxHeight: 100)
                                                .aspectRatio(1, contentMode: .fit)
                                                .clipped()
                                                .cornerRadius(8)
                                        },
                                        placeholder: {
                                            ProgressView()
                                        }
                                    )
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(character.name ?? "")
                                            .font(.custom("Get Schwifty", size: 25))
                                            .foregroundStyle(.purple)
                                            .lineLimit(2)
                                        Text(character.status ?? "")
                                            .font(.custom("Get Schwifty", size: 20))
                                            .foregroundStyle(character.status == "Alive" ? .green : character.status == "Dead" ? .red : .white)
                                    }
                                }
                            }
                        }
                    }
                    .navigationBarTitle(
                        Text("Characters")
                            .font(.custom("Get Schwifty", size: 30))
                            .foregroundColor(.white)
                        
                    )
                    .navigationBarHidden(!isListPresent)
                    .hidden(!isListPresent)
                }
                
                WelcomeView()
                    .hidden(isListPresent)
            }
            
            Button {
                if !isListPresent {
                    let charactersService = CharactersService(webService: webService)
                    Task {
                        guard let characters = await charactersService.fetchData() else { return }
                        self.characters = characters
                    }
                }
                isListPresent.toggle()
            } label: {
                Text(isListPresent ? "Go back" : "Download characters")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("Get Schwifty", size: 25))
                    .padding(20)
                    .foregroundColor(.white)
                    .background(isListPresent ? .green : .purple,
                                in: RoundedRectangle(
                                    cornerRadius: 16,
                                    style: .continuous
                                )
                    )
            }
            .padding()
            
        }
        .onAppear {
            Task {
                await webService.getEndpoints()
            }
        }
    }
}

#Preview {
    CharactersListView(webService: WebService())
}
