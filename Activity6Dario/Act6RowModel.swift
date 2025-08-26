//
//  Act6RowModel.swift
//  Activity6Dario
//
//  Created by Alumno on 25/08/25.
//

import SwiftUI

struct Act6RowView: View { // Detail row view
    let character: Character

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            
            Spacer()
            Text(character.name)
                .font(.title3.bold())
                .foregroundColor(.primary)

            Spacer()
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    ContentView()
}

