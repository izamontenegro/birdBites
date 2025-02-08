//
//  UserData.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 08/02/25.
//
import Foundation
import SwiftData

@Model
class User: Identifiable, Hashable {
    
    var userName: String
    var password: String
    
    // esse aqui eu ainda nao sei direito unheunhe
    var comedouros: [ComedouroData]
    
    init(
        name: String = "",
        password: String = ""
    ) {
        self.userName = name
        self.password = password
        self.comedouros = []
    }
}
