//
//  AdicionarComedouroView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 08/02/25.
//

// aqui eu ia tentar juntar o comedouro criado localmente com os dados recebidos mas percebi q n ia ter como ja que a gnt n recebe tbm qualeh o comedouro, mesmo q eu atribuisse ele n ia ficar atualizando em tempo real entao primeiro eh preciso receber idcomedouro + infos pra poder tratar idcomedouro.info e exibir, entao vou mockar os recebidos fazendo eles serem visiveis apenas dentro do card do comedouro, como se pertencesse a ele, cada card comedouro criado vai exibir os mesmos mockados

import SwiftUI
import SwiftData

struct AdicionarComedouroView: View {
    @Environment(\.modelContext) private var context
    @State var comedouro: ComedouroInfo
    @State var create: Bool = false
    
    @MainActor func addComedouro() {
        context.insert(comedouro)
        create = true
    }

    var body: some View {
        VStack {
            Text("adicionando comedouro")
            
            TextField("Nome do comedouro", text: $comedouro.comedouroName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(13)
                .padding(.bottom, 20)
            
            Button(action: {
                addComedouro()
            }) {
                Text("criar comedouro")
            }
            
            NavigationLink(
                destination: ContentView(),
                isActive: $create) {
                    EmptyView()
            }
        }
    }
}
