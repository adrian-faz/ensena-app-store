//
//  InfoView.swift
//  Ensena-App
//
//  Created by Adrian Faz on 07/05/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        
        VStack {
            
            Text("Sobre 'EnSeña'")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(15)
            
            VStack (alignment: .leading, spacing: 10){
                
                
                    Text("Objetivo")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Permitir que las personas puedan aprender Lengua de Señas Mexicana de una manera fácil e interactiva. Buscar una sociedad más inclusiva.")
                    .font(.footnote)
                    .padding(.bottom)
                
                Text("Desarrolladores")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("Esta aplicación fue desarrollada por alumnos del Tecnológico de Monterrey de la carrera de Ingeniería en Tecnologías Computacionales. Se desarrolló para el curso de Integración de Seguridad Informática y sistemas de software.\n")
                    .font(.caption)
                
                
                Text("Adrián Martín Hernández Barrientos\nFrancisco Mestizo Hernández\nAdrián Emmanuel Faz Mercado\nIan Alexis Odria Marín \nPablo Navarro Zepeda")
                    .font(.caption)
                    .italic()
                    .padding(.bottom)

                
                
            
                    Text("Créditos ")
                        .font(.title2)
                        .fontWeight(.bold)
                
                Text("A la profesora del laboratorio de iOS, Yolanda Martínez.\nA la profesora de Lengua de Señas Mexicana, Edyth de la Rosa.\nA los profesores del curso, Jessica Izquierdo Álvarez y Jorge Héctor de la Rosa Paredes.\nA la creadora del contenido audiovisual, Regina Márquez.\n")
                    .font(.caption)
                
                    
   
                Spacer()

                

            }

        }.padding()
        
        
        
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
