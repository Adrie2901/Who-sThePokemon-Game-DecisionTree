//
//  TypesDetail.swift
//  collectionTableView
//
//  Created by Diplomado  on 11/11/23.
//

import Foundation
import UIKit

class TypesDetailViewController: UIViewController{
    
    var dañoA = ""
    var dañoDe = ""
    var mitadDañoA = ""
    var mitadDañoDe = ""
    var noAfectaA = ""
    var noSeAfectaDe = ""
    var type = ""
    
    @IBOutlet weak var doubleDamage: UILabel!
    @IBOutlet weak var doubleDamageDe: UILabel!
    @IBOutlet weak var mitadDeDañoA: UILabel!
    @IBOutlet weak var ImageType: UIImageView!
    @IBOutlet weak var mitadDeDañoDe: UILabel!
    @IBOutlet weak var noLeAfectan: UILabel!
    @IBOutlet weak var noAfectan: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        doubleDamage.text = dañoA
        doubleDamageDe.text = dañoDe
        ImageType.image = UIImage(named: type)
        mitadDeDañoA.text = mitadDañoA
        mitadDeDañoDe.text = mitadDañoDe
        noLeAfectan.text = noSeAfectaDe
        noAfectan.text = noSeAfectaDe
        switch type {
        case "Planta": view.backgroundColor = .green
        case "Agua": view.backgroundColor = .blue
        case "Fuego" : view.backgroundColor = .red
        default: break
        }
    }
    
}
