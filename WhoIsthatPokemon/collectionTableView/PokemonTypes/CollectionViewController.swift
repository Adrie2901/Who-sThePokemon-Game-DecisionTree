//
//  CollectionViewController.swift
//  collectionTableView
//
//  Created by Diplomado  on 03/11/23.
//

import UIKit

class CollectionViewController: UIViewController {
    
    let model = TypeViewModel()
    var movies: [String] = []

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var textField: UITextField!
    
    let size = UIScreen.main.bounds.width/2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.title = "Types of Pokemons"
        
        
 
        }
    
}



extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell
        
        cell?.myTextLabel.text = model.getTitle(index: indexPath)
        cell?.typeImage.image = UIImage(named: model.getTitle(index: indexPath))
        
        
        
        return cell!
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let typesdetailStoryBoard = UIStoryboard(name: "TypesDetailStoryboard", bundle: .main)
        if let typesdetailViewController = typesdetailStoryBoard.instantiateViewController(withIdentifier: "TypesDVC") as? TypesDetailViewController {
            typesdetailViewController.type = model.getTitle(index: indexPath)
            typesdetailViewController.dañoA = model.getDoubleDamageA(index: indexPath)
            typesdetailViewController.dañoDe = model.getDoubleDamageFrom(index: indexPath)
            typesdetailViewController.mitadDañoA = model.getMitadDañoA(index: indexPath)
            typesdetailViewController.mitadDañoDe = model.getMitadDañoDe(index: indexPath)
            typesdetailViewController.noAfectaA = model.getNoAfectaA(index: indexPath)
            typesdetailViewController.noSeAfectaDe = model.getNoAfectaDe(index: indexPath)
            let navigationController = UINavigationController(rootViewController: typesdetailViewController)
            self.present(navigationController, animated: true)
        }
        
    }
    

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: size, height: size)
        return itemSize
    }
}
