//
//  BarraProgresso.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 20/01/25.
//

import SwiftUI

struct BarraProgresso: View {
    var progresso: CGFloat = 0.5
    var tipo: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(tipo == 1 ? Color.purple.opacity(0.3) : Color.verdeDetalhes.opacity(0.3))
                        .frame(height: geometry.size.height)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(tipo == 1 ? Color.purple : Color.verdeDetalhes)
                        .frame(
                            width: geometry.size.width * progresso,
                            height: geometry.size.height
                        )
                    
                    Text("\(Int(progresso * 100))%")
                        .foregroundStyle(.white)
                        .padding(.leading)
                        .font(.footnote)
                }
                
                ZStack {
                    Circle()
                        .foregroundStyle(tipo == 1 ? Color.purple : Color.verdeDetalhes)
                    Image(systemName: tipo == 1 ? "drop": "laurel.leading")
                        .foregroundStyle(.white)
                }
            }
        }
        .frame(height: 26)
    }
}

#Preview {
    VStack(spacing: 20) {
        BarraProgresso(progresso: 0.6, tipo: 1)
        BarraProgresso(progresso: 0.3, tipo: 0)
    }
    .padding()
}
