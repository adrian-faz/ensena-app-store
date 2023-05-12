//
//  InfoView.swift
//  Ensena-App
//
//  Created by Adrian Faz on 07/05/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        
        VStack{
            
            VStack{
                
                Image("EnsenaWhite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .padding(.top, 60)
                    .offset(x:20)
              
                    }.frame(maxWidth: .infinity, maxHeight: 350)
                .shadow(radius: 10)
            .background(RoundedRectangle(cornerRadius: 55).fill(.teal))
            
            
            HStack{
                Text("¡Bienvenido a ")
                    .padding(0)
                
                Text("enSeña!")
                    .fontWeight(.heavy)
                    .padding(0)
                    .foregroundColor(.teal)
            }
            
            .padding(.top,40)
            .font(.title)
            
            
            Spacer()
            

        }.ignoresSafeArea(.all)
        
        
        
        /*
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Image(systemName: "info.circle.fill")
                        .padding()
                    
                }
                
                VStack{
                    
                    Image("MainLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.top, 70)
                        .offset(x:20,y:0)
                    
                    HStack{
                        Text("¡Bienvenido a ")
                            .padding(0)
                        Text("enSeña!")
                            .bold()
                            .padding(0)
                            .foregroundColor(.teal)
                    }
                    .padding(.top,40)
                    .font(.title)
                    
                    Text("¡Aprende Lengua de Señas Mexicana de una manera fácil e interactiva!")
                        .fontWeight(.semibold)
                        .padding()
                        .padding(.horizontal)
                    
                    
                    VStack (alignment: .leading, spacing: 20){
                        HStack (spacing: 15){
                            Text("📹")
                                .font(.title)
                                .foregroundColor(.teal)
                            Text("Videos de contenido LSM.")
                        }
                        HStack (spacing: 15){
                            Text("✅")
                                .font(.title)
                                .foregroundColor(.teal)
                            
                            Text("Exámenes de práctica.")
                        }
                        
                        HStack (spacing: 15){
                            Text("📖")
                                .font(.title)
                                .foregroundColor(.teal)
                            Text("Diccionario de señas.")
                        }
                        
                        
                    }
                    .padding()
                    Spacer()
                }
            }
        }
         */
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
