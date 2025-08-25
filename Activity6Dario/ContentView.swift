//
//  ContentView.swift
//  Activity6Dario
//
//  Created by Alumno on 25/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var characterVM = Act6ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Rick & Morty Main Characters")
                    .font(.title)
                    .foregroundColor(.green)
                    .shadow(color: .yellow, radius: 1, x: 1, y: 1)
                    .padding(.bottom, 10)
                
                if let error = characterVM.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
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

