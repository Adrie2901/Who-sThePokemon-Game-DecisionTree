//
//  PokemonFavoritesViewModel.swift
//  collectionTableView
//
//  Created
//

import Foundation

class PokemonFavoritesViewModel {
    
    var favorites: [PokemonModel] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        let favoritePokemonData = UserDefaults.standard.data(forKey: "favorites")
        
        
        if let temporalFavoritePokemonData = favoritePokemonData {
            let decoder = JSONDecoder()

            favorites = try! decoder.decode([PokemonModel].self,
                                            from: temporalFavoritePokemonData)
        }
        
    }
    
    func removePokemon(at indexPath: IndexPath) {
            favorites.remove(at: indexPath.row)
            
            let encoder = JSONEncoder()
            let data = try! encoder.encode(favorites)
            
            UserDefaults.standard.setValue(data, forKey: "favorites")
        }
    
    func getCountArray() -> Int{
        favorites.count
    }
    
    func getName(index: IndexPath) -> String {
        favorites[index.row].name
    }
    
    func getImage(index: IndexPath) -> String{
        favorites[index.row].image
    }
    
    func getNumber(index: IndexPath) -> String {
        let pokemonNumber = favorites[index.row].number
        return String(format: "%03d", pokemonNumber)
    }
    
    func getInformation(index: IndexPath) -> String {
        favorites[index.row].information
    }
    
    func getType(index: IndexPath) -> String {
        favorites[index.row].type
    }
    func getCadena(index: IndexPath) -> String {
        favorites[index.row].cadenaEvolutivaPokemon
    }
}
