//
//  PokeViewModel.swift
//  PokeApi (iOS)
//
//  Created by OsXpert on 10/10/22.
//

import Foundation
import SwiftUI

class PokeViewModel : ObservableObject {
    @Published var pokemon = [PokeData]()
    let apiURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemonData()
        print("data:", pokemon)
    }
    
    func fetchPokemonData(){
        guard let url = URL(string: apiURL) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let cleanData = data?.parseData(removeString: "null,") else{ return }

            DispatchQueue.main.async {
                do{
                    let pokemon = try JSONDecoder().decode([PokeData].self, from: cleanData)
                    self.pokemon = pokemon
                } catch{
                    print("error msg:",error)
                }
            }
           
        }
        task.resume()
    }
}


extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString? .replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        
        return data
        }
}
