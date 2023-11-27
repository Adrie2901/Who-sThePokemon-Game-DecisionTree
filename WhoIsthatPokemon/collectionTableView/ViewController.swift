//
//  ViewController.swift
//  collectionTableView
//
//  Created by Diplomado  on 03/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var model = PokemonViewModel()
    var favorites: [String] = []
    
    
    
    private var selectedPokemon: IndexPath?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.delegate = self
        tableView.reloadData()
        
    }


    @IBAction func sortButton(_ sender: Any) {
        if tableView.isEditing{
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell?.accessoryType = .disclosureIndicator
        }
        cell?.textLabel?.text = model.getName(index: indexPath)
        cell?.detailTextLabel?.text = model.getNumber(index: indexPath)
        cell?.detailTextLabel?.textColor = .red
        cell?.imageView?.image = UIImage(named: model.getImage(index: indexPath)) 
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let addToFavoritesAction = UIContextualAction(style: .normal, title: "Add to favs") { (_, _, completionHandler) in
                
                if self.favorites.contains(self.model.getName(index: indexPath)){
                    self.model.readFavoriteData()
                    
                } else {
                    self.favorites.append(self.model.getName(index: indexPath))
                    self.model.saveFavorite(pokemon: self.model.pokemonArray[indexPath.row])
                }
        
                print(self.favorites)
                completionHandler(true)
            }
            
            addToFavoritesAction.backgroundColor = UIColor.red
            
            let configuration = UISwipeActionsConfiguration(actions: [addToFavoritesAction])
            return configuration
        }
    
       }


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailStoryBoard = UIStoryboard(name: "PokemonDetail", bundle: .main)
        if let detailViewController = detailStoryBoard.instantiateViewController(withIdentifier: "DetailVC") as? PokemonDetailViewController {
            detailViewController.selectedPokemon = model.getName(index: indexPath)
            detailViewController.pokemonType = model.getType(index: indexPath)
            detailViewController.pokemonNumber = model.getNumber(index: indexPath)
            detailViewController.pokemonDescription = model.getInformation(index: indexPath)
            detailViewController.cadenaPokemon = model.getCadena(index: indexPath)
            detailViewController.Pokegeneracion = model.getGeneration(index: indexPath)
            let navigationController = UINavigationController(rootViewController: detailViewController)
            self.present(navigationController, animated: true)
        }
        
        
    }
}



extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        model.filterPokemons(with: searchText)
        
        tableView.reloadData()
    }
    
    
}


