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
                .font(.title)
                .fontWeight(.bold)
                .padding(5)
            
            VStack (alignment: .leading, spacing: 10){
                
                Text("Enseña ha sido desarrollado por estudiantes del Tecnológico de Monterrey durante el semestre Agosto Diciembre 2022.")
                .font(.footnote)
                .padding(.bottom)
                

                
                Text("Créditos ")
                    .font(.title2)
                    .fontWeight(.bold)
                    
                
                Text("Desarrolladores")
                    .fontWeight(.semibold)
                
                /*
                Text("Esta aplicación fue desarrollada por alumnos del Tecnológico de Monterrey de la carrera de Ingeniería en Tecnologías Computacionales. Se desarrolló para el curso de Integración de Seguridad Informática y sistemas de software.\n")
                    .font(.caption)
                */
                
                Text("Adrián Martín Hernández Barrientos\nFrancisco Mestizo Hernández\nAdrián Emmanuel Faz Mercado\nIan Alexis Odria Marín \nPablo Navarro Zepeda")
                    .font(.caption)
                    .italic()
                    .padding(.bottom)
                
                VStack (alignment: .leading, spacing: 10){
                    
                    Text("Instructora de LSM")
                        .fontWeight(.semibold)
                    
                    Text("Edyth Estela de la Rosa Lozoya")
                        .font(.caption)
                        .italic()
                        .padding(.bottom)
                    
                }
                
                VStack (alignment: .leading, spacing: 10){
                    Text("Fotografía y Video")
                        .fontWeight(.semibold)
                    
                    Text("Rebeca Patricia Fuentes García")
                        .font(.caption)
                        .italic()
                        .padding(.bottom)
                    
                }
                
                VStack (alignment: .leading, spacing: 10){
                    
                    Text("Profesores Asesores")
                        .fontWeight(.semibold)

                    Text("Yolanda Martínez Treviño\nJessica Izquierdo Álvarez\nJorge Héctor de la Rosa Paredes")
                        .font(.caption)
                        .italic()
                        .padding(.bottom)
                }
                
                Text("EnSeña se distribuye como está de manera gratuita y se prohíbe su distribución y uso con fines de lucro.")
                .font(.footnote)
                .padding(.bottom)
                
                    
   
                

            }

        }.padding()
        
        
       
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
