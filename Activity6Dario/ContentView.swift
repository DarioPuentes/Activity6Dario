//
//  ContentView.swift
//  Activity6Dario
//
//  Created by Alumno on 25/08/25.
//  API used: https//rickandmortyapi.com/api

import SwiftUI

struct ContentView: View {
    @StateObject var characterVM = Act6ViewModel()
    
    var body: some View { // Main page
        NavigationStack {
            VStack (alignment: .center){
                Text("Rick & Morty Main Characters")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.bottom, 10)
                
                if let error = characterVM.errorMessage {
                    Spacer()
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                    Spacer()
                } else {
                    List(characterVM.arrCharacter) { item in
                        NavigationLink {
                            Act6DetailView(character: item)
                        } label: {
                            Act6RowView(character: item)
                        }
                    }
                }
            }
            .task {
                await characterVM.getPhotosCharacter()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

