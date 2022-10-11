

import SwiftUI

struct PokeList: View {
    // apply grid for pokemon list
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: gridItems, spacing: 5) {
                    ForEach(viewModel.pokemon) { pokemon in
                        NavigationLink(destination: PokeDetail(pokemonData: pokemon, pokemonViewModel: viewModel)){
                            PokeCard(pokemonData: pokemon, pokemonViewModel: viewModel)
                        }
                    }
                }
                .padding(.top, 15)
            }
            .navigationTitle("POKEAPP")
        }
        .accentColor(.white)
    }
}
