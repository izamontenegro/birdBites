//
//  EditarComedouro.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//

import SwiftUI
import SwiftData

struct EditarComedouroView: View {
    @Environment(\.modelContext) private var context
    @State var comedouro: ComedouroInfo
    @State private var updatedName: String
    @State private var saved: Bool = false
    @State private var deleted: Bool = false
    @State private var showAlert: Bool = false

    init(comedouro: ComedouroInfo) {
        self._comedouro = State(initialValue: comedouro)
        self._updatedName = State(initialValue: comedouro.comedouroName)
    }

    @MainActor func saveChanges() {
        comedouro.comedouroName = updatedName
        try? context.save()
        saved = true
    }
    
    @MainActor func deleteComedouro() {
        context.delete(comedouro)
        try? context.save()
        deleted = true
    }

    var body: some View {
        VStack {
            NavigationLink(destination: ContentView(), isActive: $deleted) {
                EmptyView()
            }
            
            NavigationLink(destination: ContentView(), isActive: $saved) {
                EmptyView()
            }

            Text("Editando comedouro")
            
            TextField("Nome do comedouro", text: $updatedName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(13)
                .padding(.bottom, 20)
            
            Button(action: {
                saveChanges()
            }) {
                Text("Salvar alterações")
            }
            .padding(.bottom, 10)

            Button(action: {
                showAlert = true
            }) {
                Text("Excluir comedouro")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .alert("Você tem certeza que deseja excluir?", isPresented: $showAlert) {
            Button("Cancelar", role: .cancel) { }
            Button("Excluir", role: .destructive) {
                deleteComedouro()
            }
        } message: {
            Text("Não será possível recuperar essa ação.")
        }
    }
}
