//
//  PokeData.swift
//  PokeApi (iOS)
//
//  Created by OsXpert on 10/10/22.
//

import Foundation

struct PokeData : Decodable, Identifiable {
    let id : Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Float
    let height: Float
    let description: String
    let attack: Float
    let defense: Float
}
