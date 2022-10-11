

import SwiftUI
import Kingfisher

struct PokeCard: View {
    let pokemonData : PokeData
    let pokemonViewModel: PokeViewModel
    
    init(pokemonData: PokeData, pokemonViewModel: PokeViewModel){
        self.pokemonData = pokemonData
        self.pokemonViewModel = pokemonViewModel
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                
                VStack{
                    Text(pokemonData.name.capitalized)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    KFImage(URL(string: pokemonData.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 5)
                }
            }
        }
        .cornerRadius(12)
        
    }
}

