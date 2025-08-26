//
//  Act6SDetailModel.swift
//  Activity6Dario
//
//  Created by Alumno on 25/08/25.
//

import SwiftUI

struct Act6DetailView: View {
    let character: Character

    var body: some View {
        VStack(spacing: 20) {
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
        .padding()
    }
}

#Preview {
    ContentView()
}

