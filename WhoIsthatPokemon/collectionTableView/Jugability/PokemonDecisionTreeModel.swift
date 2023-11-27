//
//  PokemonDecisionTreeModel.swift
//  collectionTableView
//
//  Created by Adriana Ruiz on 26/11/23.
//

import Foundation

class Node {
    
    var value: String
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

class PokemonDecisionTree {
    let rootNode: Node
    
    init() {
        // Root node
        rootNode = Node(value: "¿Tiene Cadena Evolutiva? ➡️")
        
        // MARK: Yes branch (Cadena Evolutiva)
        let yesNode = Node(value: "¿Es de primera generación? 1️⃣")
        rootNode.add(child: yesNode)
        //MARK: Si PRIMERA GEN
        let tipoAguaNodeY = Node(value: "Tu pokemon es de tipo Agua? 💧")
        let tipoFuegoNode = Node(value: "Es de tipo Fuego? 🔥")
        let tipoPlantaNode = Node(value: "Entonces tu pokemon debe ser tipo Planta 🌱")
        //No 1gen
        let segundaGenNodeY = Node(value: "Tu pokemon es de Segunda generación? 2️⃣")
        
        // Si Agua
        yesNode.add(child: tipoAguaNodeY)
        yesNode.add(child: segundaGenNodeY)
        tipoAguaNodeY.add(child: Node(value: "Squirtle"))
        //Sí Fuego
        tipoAguaNodeY.add(child: tipoFuegoNode)
        tipoFuegoNode.add(child: Node(value: "Charmander"))
        //Sí planta
        tipoFuegoNode.add(child: tipoPlantaNode)
        tipoPlantaNode.add(child: Node(value: "Bulbasaur"))
        tipoPlantaNode.add(child: Node(value: "ajeno a la lista disponible 👿"))
        
        //MARK: SEGUNDA GEN
        let tipoAguaNode2 = Node(value: "Tu pokemon es de tipo Agua? 💧")
        let tipoFuegoNode2 = Node(value: "Es de tipo Fuego? 🔥")
        let tipoPlanta2 = Node(value: "Entonces tu pokemon debe ser tipo Planta 🌱")
        let terceraGen = Node(value: "Tu pokemon es de Tercera generación? 3️⃣")
        segundaGenNodeY.add(child: tipoAguaNode2)
        segundaGenNodeY.add(child: terceraGen)
        //Si agua
        tipoAguaNode2.add(child: Node(value: "Totodile"))
        tipoAguaNode2.add(child: tipoFuegoNode2)
        // Si fuego
        tipoFuegoNode2.add(child: Node(value: "Cyndaquil"))
        tipoFuegoNode2.add(child: tipoPlanta2)
        //Si planta
        tipoPlanta2.add(child: Node(value: "Chikorita"))
        tipoPlanta2.add(child: Node(value: "ajeno a la lista disponible." ))
        
        //MARK: TERCERA GEN
        let tipoAguaNode3 = Node(value: "Tu pokemon es de tipo Agua? 💧")
        let tipoFuegoNode3 = Node(value: "Es de tipo Fuego? 🔥")
        let tipoPlanta3 = Node(value: "Entonces tu pokemon debe ser tipo Planta 🌱")
        let CuartaGen = Node(value: "Tu pokemon es de Cuarta generación? 4️⃣")
        terceraGen.add(child: tipoAguaNode3)
        terceraGen.add(child: CuartaGen)
        //Si agua
        tipoAguaNode3.add(child: Node(value: "Mudkip"))
        tipoAguaNode3.add(child: tipoFuegoNode3)
        // Si fuego
        tipoFuegoNode3.add(child: Node(value: "Torchic"))
        tipoFuegoNode3.add(child: tipoPlanta3)
        //Si planta
        tipoPlanta3.add(child: Node(value: "Treecko"))
        tipoPlanta3.add(child: Node(value: "ajeno a la lista disponible 👿" ))
        
        //MARK: CUARTA GEN
        let tipoAguaNode4 = Node(value: "Tu pokemon es de tipo Agua? 💧")
        let tipoFuegoNode4 = Node(value: "Es de tipo Fuego? 🔥")
        let tipoPlanta4 = Node(value: "Entonces tu pokemon debe ser tipo Planta 🌱")
        let quintaGen = Node(value: "Tu pokemon es de Quinta generación? 5️⃣")
        CuartaGen.add(child: tipoAguaNode4)
        CuartaGen.add(child: quintaGen)
        //Si agua
        tipoAguaNode4.add(child: Node(value: "Piplup"))
        tipoAguaNode4.add(child: tipoFuegoNode4)
        // Si fuego
        tipoFuegoNode4.add(child: Node(value: "Chimchar"))
        tipoFuegoNode4.add(child: tipoPlanta4)
        //Si planta
        tipoPlanta4.add(child: Node(value: "Turtwig"))
        tipoPlanta4.add(child: Node(value: "ajeno a la lista disponible 👿" ))
        
        //MARK: QUINTA GEN
        let tipoAguaNode5 = Node(value: "Tu pokemon es de tipo Agua? 💧")
        let tipoFuegoNode5 = Node(value: "Es de tipo Fuego? 🔥")
        let tipoPlanta5 = Node(value: "Entonces tu pokemon debe ser tipo Planta 🌱")
        quintaGen.add(child: tipoAguaNode5)
        quintaGen.add(child: Node(value: "ajeno a la lista disponible 👿"))
        //Si agua
        tipoAguaNode5.add(child: Node(value: "Oshawott"))
        tipoAguaNode5.add(child: tipoFuegoNode5)
        // Si fuego
        tipoFuegoNode5.add(child: Node(value: "Tepig"))
        tipoFuegoNode5.add(child: tipoPlanta5)
        //Si planta
        tipoPlanta5.add(child: Node(value: "Snivy"))
        tipoPlanta5.add(child: Node(value: "ajeno a la lista disponible 👿" ))
        
        
        // MARK: No branch (Cadena Evolutiva)
        let noNode = Node(value: "¿Es de primera generación? 1️⃣")
        rootNode.add(child: noNode)
        let tipoNormalNode = Node(value: "Tu pokemon es de tipo Normal? 👀")
        let tipoPsiquicoNode = Node(value: "Entonces es de tipo Psíquico? 🧠")
        let segundaGenNodeN = Node(value: "Es de segunda generación? 2️⃣")
        // MARK: Generación 1
        noNode.add(child: tipoNormalNode)
        noNode.add(child: segundaGenNodeN)
        
        // Si Normal
        tipoNormalNode.add(child: Node(value: "Tauros"))
        tipoNormalNode.add(child: tipoPsiquicoNode)
        //Si psíquico
        tipoPsiquicoNode.add(child: Node(value: "Mr. Mime"))
        tipoPsiquicoNode.add(child: Node(value: "ajeno a la lista disponible 👿"))
        
        // MARK: Generación 2
        let tipoNormalNode2 = Node(value: "Tu pokemon es de tipo Normal? 👀")
        let tipoPsiquicoNode2 = Node(value: "Entonces es de tipo Psíquico? 🧠")
    
        segundaGenNodeN.add(child: tipoNormalNode2)
        segundaGenNodeN.add(child: Node(value: "ajeno a la lista disponible 👿"))
        
        // Si Normal
        tipoNormalNode2.add(child: Node(value: "Ditto"))
        tipoNormalNode2.add(child: tipoPsiquicoNode2)
        //Si psíquico
        tipoPsiquicoNode2.add(child: Node(value: "Unown"))
        tipoPsiquicoNode2.add(child: Node(value: "ajeno a la lista disponible 👿"))
        
        
    }
    
}

