//
//  MainQuizView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 13/11/22.
//

import SwiftUI

enum Questions: String, CaseIterable, Identifiable {
    case five, ten, all
    var id: Self { self }
}

func convertSelection(selection: Questions, cursoId: String) -> Int {
    switch selection{
    case .five:
        numberQuestions = 5
        return 5
    case .ten:
        numberQuestions = 5
        return 10
    case .all:
        var words: [Palabra]
        words = cargaPalabras(course: currentCourseId)
        numberQuestions = words.count
        return words.count
    }
}


struct MainQuizView: View {
    @State private var selectedQuestions: Questions = .five
    var cursoId: String
    @StateObject var triviaManager = TriviaManager(courseId: currentCourseId)
    var body: some View {

        NavigationView {
            VStack{
                    VStack(spacing: 20){
                        Text("Quiz: \(cursoId)" ).font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("Teal"))
                        
                        Text("¡Hora de practicar lo que aprendiste! Presiona el botón con enSeñito para comenzar")
                            .foregroundColor(Color("Teal"))
                            .padding(.horizontal, 25)
                            .multilineTextAlignment(.center)
                            
                    }
                    .padding(.bottom, 120)
                
                
                NavigationLink() {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    /*
                    Text("❔")
                    .font(.system(size: 72))
                    .foregroundColor(.white)
                    .frame(width: 55, height: 85)
                    .padding()
                    .padding(.horizontal)
                    .background(Color("Teal"))
                    .cornerRadius(1000)
                    .shadow(radius: 10)
                     */
                    VStack{
                        Image("iconoAdminProfile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 85)
                            .padding()
                            .padding(.horizontal)
                            .background(Color("Teal"))
                            .cornerRadius(1000)
                            .shadow(radius: 10)
                        Text("Comenzar")
                            .font(.system(size: 24))
                            .foregroundColor(Color("Teal"))
                            .padding(.top, 10)
                    }
                }
                .simultaneousGesture(TapGesture().onEnded{
                    triviaManager.resetQuestions(courseId: cursoId, numQuestions: convertSelection(selection: selectedQuestions, cursoId: cursoId))
                })
                .padding(.bottom, 150)
                
                HStack{
                    
                    Text("Selecciona la cantidad de preguntas para el quiz")
                        .foregroundColor(Color("Teal"))
                        .padding(.horizontal, 25)
                        .multilineTextAlignment(.center)
                    
                    Picker("Flavor", selection: $selectedQuestions) {
                        if convertSelection(selection: .all, cursoId: cursoId) >= 5{
                            Text("5").tag(Questions.five)
                        }
                        if convertSelection(selection: .all, cursoId: cursoId) >= 10{
                            Text("10").tag(Questions.ten)
                        }
                        Text("Todas").tag(Questions.all)
                    }
                    
                }
                .padding(.horizontal, 20)

                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
        }
        .onAppear{
            currentCourseId = cursoId
            currentCourseTitle = cursoId
        }

    } 
    
}


struct MainQuizView_Previews: PreviewProvider {
    static var previews: some View {
        MainQuizView(cursoId: "Abecedario")
    }
}
