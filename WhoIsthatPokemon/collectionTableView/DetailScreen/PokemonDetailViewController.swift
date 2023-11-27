//
//  PokemonDetailViewController.swift
//  collectionTableView
//
//  Created by Diplomado  on 10/11/23.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var selectedPokemon = ""
    var pokemonType = ""
    var pokemonNumber = ""
    var pokemonDescription = ""
    var cadenaPokemon = ""
    var Pokegeneracion = ""
 
    
    var model = TypeViewModel()
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var informationDetail: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
    @IBOutlet var tipo: UILabel!
    @IBOutlet var cadenaEvolutiva: UILabel!
    @IBOutlet weak var generación: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonName.text = selectedPokemon
        number.text = pokemonNumber
        generación.text = Pokegeneracion
        informationDetail.text = pokemonDescription
        Image.image = UIImage(named: selectedPokemon)
        tipo.text = pokemonType
        if cadenaPokemon == ""{
            cadenaEvolutiva.text = "No existe cadena evolutiva."
        }
        else{
            cadenaEvolutiva.text = cadenaPokemon
        }
        self.title = "Tarjeta resumida del pokemon"
        
    }
    
}
