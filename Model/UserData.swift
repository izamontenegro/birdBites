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
    var comedouros: [ComedouroData]
    
    init(
        name: String = "usuario",
        password: String = ""
    ) {
        self.userName = name
        self.password = password
        self.comedouros = []
    }
}
