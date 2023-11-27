//
//  WinnerViewController.swift
//  collectionTableView
//
//  Created by Ana Fragoso on 27/11/23.
//

import UIKit

class WinnerViewController: UIViewController {
    @IBOutlet weak var pokemonImage1: UIImageView!
    @IBOutlet weak var winnerText: UILabel!
    @IBOutlet weak var returnBotton: UIButton!
    @IBOutlet weak var pokemonImage2: UIImageView!
    var pokemon = Node(value: "Bulbasaur")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonImage1.image = UIImage(named:pokemon.value)
        
      
        winnerText.text = "✨   ¡Adiviné!   ✨\n\nEl Pokémon es \(pokemon.value)."
        // Do any additional setup after loading the view.
    }
    

    @IBAction func returnButtonAction(_ sender: Any) {
        returnGame = true
        navigationController?.popViewController(animated: true)
        //dismiss(animated: true)
    }
}
