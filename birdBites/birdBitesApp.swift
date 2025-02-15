//
//  birdBitesApp.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

import SwiftUI
import SwiftData

@main
struct birdBitesApp: App {
    var body: some Scene {
        WindowGroup {
            BoasVindasView()
        }
        .modelContainer(for: [User.self, ComedouroInfo.self])
    }
}
