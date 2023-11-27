//
//  ViewController.swift
//  Who'sThatPokemon
//
//  Created by Adriana Ruiz on 23/11/23.
//

import UIKit


class PokemonGuessWhoViewController: UIViewController {
    
    var currentQuestionNode: Node?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if returnGame == true{
            startNewGame()
        }
        else{
            return
        }
    }
    

    func startNewGame() {
        let decisionTreeModel = PokemonDecisionTree()
        currentQuestionNode = decisionTreeModel.rootNode
        askQuestion()
    }

    func askQuestion() {
        guard let currentQuestionNode = currentQuestionNode else {
            return
        }
        questionLabel.text = currentQuestionNode.value
        yesButton.isHidden = false
        noButton.isHidden = false
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        guard var currentQuestionNode = currentQuestionNode else {
            return
        }

        let playerAnswer: Bool
        
        if sender == yesButton {
            playerAnswer = true
        } else if sender == noButton {
            playerAnswer = false
        } else {
            return
        }

        if let nextNode = playerAnswer ? currentQuestionNode.children.first : currentQuestionNode.children.last {
            if nextNode.children.isEmpty {
                showResult(pokemonNode: nextNode)
            } else {
                self.currentQuestionNode = nextNode
                questionLabel.text = currentQuestionNode.value
                askQuestion()
            }
        }
    }

    func showResult(pokemonNode: Node) {
    /*    let alertController = UIAlertController(title: "¡Adiviné!",
                                                message: "El Pokémon es \(pokemonNode.value). ¿Quieres jugar de nuevo?",
                                                preferredStyle: .alert)
        let playAgainAction = UIAlertAction(title: "Sí", style: .default) { [weak self] _ in
            self?.startNewGame()
        }
        alertController.addAction(playAgainAction)
        present(alertController, animated: true, completion: nil)
     */
        guard let winnerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WinnerViewController") as? WinnerViewController else{return}
        //winnerViewController.pokemon = pokemonNode
        winnerViewController.pokemon = pokemonNode
        
        navigationController?.pushViewController(winnerViewController, animated: true)
    }

}



