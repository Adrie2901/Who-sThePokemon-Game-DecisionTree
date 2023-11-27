//
//  FavoritesViewController.swift
//  collectionTableView
//
//  Created by Diplomado  on 10/11/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let model2 = PokemonFavoritesViewModel()
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            model2.loadData()
            tableView.reloadData()
        }


}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model2.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell?.accessoryType = .disclosureIndicator
        }
        cell?.textLabel?.text = model2.getName(index: indexPath)
        cell?.detailTextLabel?.text = model2.getNumber(index: indexPath)
        cell?.detailTextLabel?.textColor = .red
        cell?.imageView?.image = UIImage(named: model2.getImage(index: indexPath))
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                model2.removePokemon(at: indexPath)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
            }
        }
    
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailStoryBoard = UIStoryboard(name: "PokemonDetail", bundle: .main)
        if let detailViewController = detailStoryBoard.instantiateViewController(withIdentifier: "DetailVC") as? PokemonDetailViewController {
            detailViewController.selectedPokemon = model2.getName(index: indexPath)
            detailViewController.pokemonType = model2.getType(index: indexPath)
            detailViewController.pokemonNumber = model2.getNumber(index: indexPath)
            detailViewController.pokemonDescription = model2.getInformation(index: indexPath)
            detailViewController.cadenaPokemon = model2.getCadena(index: indexPath)
            
            let navigationController = UINavigationController(rootViewController: detailViewController)
            self.present(navigationController, animated: true)
        }
        
        
    }
}
