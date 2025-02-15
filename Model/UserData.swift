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
    
    // esse aqui acho q eh so quando receber varios comedouros
    // var comedouros: [ComedouroInfo]
    
    init(
        name: String = "",
        password: String = ""
    ) {
        self.userName = name
        self.password = password
    }
}
