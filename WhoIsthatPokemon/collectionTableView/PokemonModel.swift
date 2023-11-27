//
//  Pokemon.swift
//  collectionTableView
//
//  Created by Diplomado  on 10/11/23.
//

import Foundation

var returnGame: Bool = false

struct PokemonModel: Codable {
    let image: String
    let name: String
    let number: Int
    let information: String
    let type: String
    let cadenaEvolutivaPokemon: String
    let generación: String
}

class PokemonViewModel {
    var pokemonArray = [PokemonModel]()
    var filteredPokemons: [PokemonModel]
    
    init() {
        pokemonArray = [PokemonModel(image: "Chikorita", name: "Chikorita", number: 001, information: "Un pokemon de tipo planta que parece una tierna hierba. Es muy sensible a su entorno", type: "Planta", cadenaEvolutivaPokemon: "Chikorita > Bayleef > Meganium", generación: "Segunda"),
                        PokemonModel(image: "Charmander", name: "Charmander", number: 004, information: "Un pokemon de tipo Fuego que se parece a una lagartija. Su cola siempre está ardiendo", type: "Fuego", cadenaEvolutivaPokemon: "Charmander > Charmeleon > Charizard", generación: "Primera"),
                        PokemonModel(image: "Squirtle", name: "Squirtle", number: 007, information: "Un pokemon de tipo Agua que parece una tortuga. Su cuerpo está cubierto de una capa gruesa y resistente", type: "Agua", cadenaEvolutivaPokemon: "Squirtle > Wartortle > Blastoise", generación: "Primera"),
                        PokemonModel(image: "Totodile", name: "Totodile", number: 158, information: "Un pokemon de tipo Agua que parece un cocodrilo. Es muy jugueton y le encanta nadar", type: "Agua", cadenaEvolutivaPokemon: "Totodile > Croconaw > Feraligatr", generación: "Segunda"),
                        PokemonModel(image: "Bulbasaur", name: "Bulbasaur", number: 001, information: "Un pokemon de tipo Planta que parece una rama. Sus semillas brotan de su espalda", type: "Planta/Veneno", cadenaEvolutivaPokemon: "Bulbasaur > Ivysaur > Venusaur", generación: "Primera"),
                        PokemonModel(image: "Cyndaquil", name: "Cyndaquil", number: 155, information: "Un pokemon de tipo Fuego que parece un puercoespin. Su pelaje es tan suave como la seda", type: "Fuego", cadenaEvolutivaPokemon: "Cyndaquil > Quilava > Typhlosion", generación: "Segunda"),
                        PokemonModel(image: "Treecko", name: "Treecko", number: 252, information: "Un pokemon de tipo Planta que parece un lagarto. Es muy rápido y ágil", type: "Planta", cadenaEvolutivaPokemon: "Treecko > Grovyle > Sceptile", generación: "Tercera"),
                        PokemonModel(image: "Torchic", name: "Torchic", number: 255, information: "Un pokemon de tipo Fuego que parece un polluelo. Es muy fuerte y tiene una gran resistencia", type: "Fuego", cadenaEvolutivaPokemon: "Torchic > Combusken > Blaziken", generación: "Tercera"),
                        PokemonModel(image: "Mudkip", name: "Mudkip", number: 258, information: "Un pokemon de tipo Agua que parece un renacuajo. Es muy resistente y tiene una gran fuerza", type: "Agua", cadenaEvolutivaPokemon: "Mudkip > Marshtomp > Swamper", generación: "Tercera"),
                        PokemonModel(image: "Turtwig", name: "Turtwig", number: 387, information: "Un pokemon de tipo Planta que parece una tortuga. Es muy tranqulo y reflexivo.", type: "Planta", cadenaEvolutivaPokemon: "Turtwig > Grotle > Torterra", generación: "Cuarta"),
                        PokemonModel(image: "Chimchar", name: "Chimchar", number: 390, information: "Un pokemon de tipo Fuego que parece un mono. Es muy activo y le encanta jugar", type: "Fuego", cadenaEvolutivaPokemon: "Chimchar > Monferno > Infernape", generación: "Cuarta"),
                        PokemonModel(image: "Piplup", name: "Piplup", number: 393, information: "Un pokemon de tipo Agua que parece un pingüino. Es muy curioso y le encanta exolorar", type: "Agua", cadenaEvolutivaPokemon: "Pinplup > Prinplup > Empoleon", generación: "Cuarta"),
                        PokemonModel(image: "Snivy", name: "Snivy", number: 494, information: "Un pokemon de tipo Planta que parece una serpiente. Es muy inteligente y calculador", type: "Planta", cadenaEvolutivaPokemon: "Snivy > Servine > Serperior", generación: "Quinta"),
                        PokemonModel(image: "Tepig", name: "Tepig", number: 497, information: "Un pokemon de tipo Fuego que parece un cerdo. Es muy activo y le encanta comer", type: "Fuego", cadenaEvolutivaPokemon: "Tepig > Pignite > Emboar", generación: "Quinta"),
                        PokemonModel(image: "Oshawott", name: "Oshawott", number: 500, information: "Un pokemon de tipo Agua que parece una nutria. Es muy valiente y le encanta proteger a sus amigos", type: "Agua", cadenaEvolutivaPokemon: "Oshawott > Dewott > Samurott", generación: "Quinta"),
                        PokemonModel(image: "Mr. Mime", name: "Mr. Mime", number: 122, information: "Es conocido por su estilo de vida teatral.", type: "Psiquico", cadenaEvolutivaPokemon: "", generación: "Primera"),
                        PokemonModel(image: "Tauros", name: "Tauros", number: 128, information: "Es conocido por su naturaleza feroz y su habilidad para embestir oponentes", type: "Normal", cadenaEvolutivaPokemon: "", generación: "Primera"),
                        PokemonModel(image: "Ditto", name: "Ditto", number: 132, information: "Puede transformarse en cualquier otro pokemon", type: "Normal", cadenaEvolutivaPokemon: "", generación: "Segunda"),
                        PokemonModel(image: "Unown", name: "Unown", number: 201, information: "Es un pokemon misterioso que tiene la forma de las letras de los signos de puntuacion", type: "Psiquico", cadenaEvolutivaPokemon: "", generación: "Segunda")
        ]
        filteredPokemons = pokemonArray
    }
        
        func getCountArray() -> Int{
            filteredPokemons.count
        }
        
        
        func getName(index: IndexPath) -> String {
            filteredPokemons[index.row].name
        }
        
        func getImage(index: IndexPath) -> String{
            filteredPokemons[index.row].image
        }
        
        func getNumber(index: IndexPath) -> String {
            let pokemonNumber = filteredPokemons[index.row].number
            return String(format: "%03d", pokemonNumber)
        }
        
        func getInformation(index: IndexPath) -> String {
            filteredPokemons[index.row].information
        }
        
        func getType(index: IndexPath) -> String {
            filteredPokemons[index.row].type
        }
        func getCadena(index: IndexPath) -> String {
            filteredPokemons[index.row].cadenaEvolutivaPokemon
        }
    
        func getGeneration(index: IndexPath) -> String {
            filteredPokemons[index.row].generación
        }
    
    
        func filterPokemons(with searchValue: String) {
            if searchValue.isEmpty {
                filteredPokemons = pokemonArray
            } else if let numberSearchValue = Int(searchValue) {
                filteredPokemons = pokemonArray.filter { pokemon in
                    pokemon.number == numberSearchValue
                }
            } else {
                filteredPokemons = pokemonArray.filter { pokemon in
                    pokemon.name.uppercased().contains(searchValue.uppercased())
                }
            }
        }
    
    
        
        func saveFavorite(pokemon: PokemonModel) {
            var favoritePokemons: [PokemonModel] = []
            if let favoritePokemonData = UserDefaults.standard.data(forKey: "favorites") {
                let decoder = JSONDecoder()
                favoritePokemons = try! decoder.decode([PokemonModel].self,
                                                       from: favoritePokemonData)
            }
            //Guarda
            favoritePokemons.append(pokemon)
            let encoder = JSONEncoder()
            let data = try! encoder.encode(favoritePokemons)
            UserDefaults.standard.setValue(data, forKey: "favorites")
        }
        
        func readFavoriteData() {
            let favoritePokemonData = UserDefaults.standard.data(forKey: "favorites")!
            let decoder = JSONDecoder()
            let favoritePokemons = try! decoder.decode([PokemonModel].self,
                                                       from: favoritePokemonData)
            print(favoritePokemons)
        }
        
}
