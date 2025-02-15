//
//  ComedouroInfo.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//
import SwiftData

@Model
class ComedouroInfo: Identifiable, Hashable {
    
    var comedouroName: String
//    tirando pelo babado la de precisar de varios
//    var dados: ComedouroData
    
    init(
        comedouroName: String = ""
//        dados: ComedouroData = ComedouroData(
//            luminosidade: 0.0,
//            temperaturaExterno: 0.0,
//            umidadeExterno: 0.0,
//            temperaturaInterno: 0.0,
//            umidadeInterno: 0.0,
//            quantidadeComida: 0
//        )
    ) {
        self.comedouroName = comedouroName
//        self.dados = dados
    }
}
