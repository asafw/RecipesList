//
//  ContentView.swift
//  RecipesList
//
//  Created by Asaf Weinberg on 10/5/24.
//

import SwiftUI

struct ContentView: View {

    @State var recipes: [Recipe] = []
    @State var isError = false

    var body: some View {
        NavigationView {
            List {
                ForEach($recipes) { $recipe in
                    HStack(spacing: 5){
                        AsyncImage(url: URL(string: recipe.photo_url_small)) { image in
                            image
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Rectangle())
                                .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
                        } placeholder: {
                            Image("placeholder")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Rectangle())
                                .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
                        }
                        VStack(alignment: .leading, spacing: 5){
                            Text(recipe.name)
                                .font(.headline)
                            Text(recipe.cuisine)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
            }
            .navigationBarTitle(Text(DefaultValues().mainTitle))
            .onAppear(perform: { updatList() })
            .refreshable { updatList() }
            .alert(DefaultValues().errorTitle, isPresented: $isError) {
                Button(DefaultValues().errorDismissButtonTitle, role: .cancel) { }
            } message: {
                Text(DefaultValues().errorMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}
