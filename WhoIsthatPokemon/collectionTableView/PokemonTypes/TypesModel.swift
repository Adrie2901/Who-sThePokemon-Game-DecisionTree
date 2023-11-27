//
//  TypesModel.swift
//  collectionTableView
//
//  Created by Diplomado  on 10/11/23.
//

import Foundation

struct PokemonTypesModel {
    let type: String
    let DoubleDamageA: String
    let DoubleDamageFrom: String
    let HalfDamageA: String
    let HalfDamageFrom: String
    let DoesntAffect: String
    let DoesntGetAffected: String
}

class TypeViewModel {
    var TypeArray = [PokemonTypesModel]()
    
    init() {
        TypeArray = [PokemonTypesModel(type: "Agua", DoubleDamageA: "Fuego, Tierra, Roca", DoubleDamageFrom: "Eléctrico, Planta", HalfDamageA: "Eléctrico, Planta", HalfDamageFrom: "Fuego, Tierra, Roca", DoesntAffect: "Bicho, Veneno, Roca", DoesntGetAffected: "Fuego, Tierra, Roca"),
                     PokemonTypesModel(type: "Fuego", DoubleDamageA: "Agua, Tierra, Roca", DoubleDamageFrom: "Hielo, Agua, Roca", HalfDamageA: "Agua, Tierra, Roca", HalfDamageFrom: "Hielo, Agua, Roca", DoesntAffect: "Normal, Fuego, Siniestro", DoesntGetAffected: "Agua, Tierra, Roca"),
                     PokemonTypesModel(type: "Planta", DoubleDamageA: "Agua, Tierra, Roca", DoubleDamageFrom: "Fuego, Volador, Hielo", HalfDamageA: "Fuego, volador, Hielo", HalfDamageFrom: "Agua, Tierra, Roca", DoesntAffect: "Bicho, Veneno, Siniestro", DoesntGetAffected: "Fuego, Volador, Hielo"),
        ]
    }
    
    func getMitadDañoA(index: IndexPath) -> String {
        TypeArray[index.row].HalfDamageA
    }
    
    func getMitadDañoDe(index: IndexPath) -> String {
        TypeArray[index.row].HalfDamageFrom
    }
    
    func getNoAfectaA(index: IndexPath) -> String {
        TypeArray[index.row].DoesntAffect
    }
    
    func getNoAfectaDe(index: IndexPath) -> String {
        TypeArray[index.row].DoesntGetAffected
    }
    
    func getCountArray() -> Int{
        TypeArray.count
    }
    
    func getDoubleDamageA(index: IndexPath) -> String {
        TypeArray[index.row].DoubleDamageA
    }
    
    func getDoubleDamageFrom(index: IndexPath) -> String {
        TypeArray[index.row].DoubleDamageFrom
    }
    
    
    func getTitle(index: IndexPath) -> String {
       TypeArray[index.row].type

    }
}

