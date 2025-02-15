//
//  ReadMe.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 15/02/25.
//

/*
 O projeto ta dividido da seguinte forma:
 - Networking: pasta com tudo que tem de conexao, mqqt e bluetooth, e telas pra testar especificamente essas coisas direto
 - View: As telas do aplicativo, sendo que elas estao separadas em
         - onboarding: autoexplicativo
         - principal: tendo fluxo de colecao (todas as telas ligadas a colecao vao estar aqui) e fluxo de comedouro (todas as telas ligadas ao comedouro) e de resto as views principais
         ps: a contentview eh onde ta sendo controlada a tab bar e que tipo de app aparece (o de teste ou o do figma) entao recomendo NAO mexer por lá
 - Model: os modelos de swiftdata e mqtt
 - Components: os componentes que vao ser usados no app, FACAM componentes pq depois quando for atualizar coisas vai ser bem mais facil, eles tao separados por views tambem, por enquanto so tem da home e alguns dos comedouros mas quando voces forem adicionar mais criem pastas, seguindo a mesma ordem do fluxo das views falado anteriormente (tudo de x na pastax, tudo e y na pasta y)
 - Os assets tao separados por pasta de cor/imagem, nao separei por view como em componentes e view mas se quiserem é uma boa. Prestem atencao na qualidade das imagens, as que eu subi ate agora foram so pra testar as coisas entao ta um cocozinho
 
 Oq precisa de navegacao e integracao eu ja fiz tudo (acredito) entao agora é so lapidar os componentes, na maioria das coisas eu coloquei comentarios entao SE tiver que integrar alguma coisa eh so copiar oq tiver de parecido e colar
 
 Deem uma lida em cada pasta e dps de ler isso aqui vai ficar facil entender a organizacao bejinhos
 */
