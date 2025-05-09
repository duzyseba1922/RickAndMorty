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
    
    @State var characters: [Character] = []
    
    var body: some View {
        VStack {
            ZStack {
                NavigationView {
                    List {
                        ForEach(characters) { character in
                            NavigationLink {
                                CharacterDetailsView()
                            } label: {
                                Text(character.name ?? "")
                            }
                        }
                    }
                    .hidden(!isListPresent)
                }
                
                HStack {
                    Text("Press the button to get characters list")
                        .font(.system(size: 30, weight: .bold))
                        .padding()
                        .hidden(isListPresent)
                }
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
                    .font(.system(size: 20, weight: .bold))
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
