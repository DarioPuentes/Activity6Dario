//
//  Act6SDetailModel.swift
//  Activity6Dario
//
//  Created by Alumno on 25/08/25.
//

import SwiftUI

struct Act6DetailView: View {
    let character: Character
    @State private var isLoading = true

    var body: some View {
        VStack(spacing: 20) { // Detail view
            if isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .green))
                    .font(.title2)
            } else {
                Text(character.name)
                    .font(.title2.bold())
                    .foregroundColor(.cyan)
                
                HStack {
                    Text("Species: ") +
                    Text("\(character.species) |")
                        .font(.headline)
                        .foregroundColor(.indigo)
                    Text("Gender: ") +
                    Text(character.gender)
                        .font(.headline)
                        .foregroundColor(.orange)
                }
                
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(height: 300)
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text(character.status)
                    .font(.footnote.bold())
                    .foregroundColor(.white)
                    .padding(.horizontal, 90)
                    .padding(.vertical, 6)
                    .background(.green)
                    .cornerRadius(20)
            }
        }
        .padding()
        .onAppear {
            // Simulates loading time
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isLoading = false
            }
        }
    }
}

#Preview {
    ContentView()
}

