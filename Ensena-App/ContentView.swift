//
//  ContentView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import SwiftUI


var currentCourseId: String = ""
var currentCourseTitle: String = ""
var idUserGlobal: String = ""
var isAdminGlobal: Bool = false






struct ContentView: View {
    
        @State var userId : String = ""
    @State var isLoggedIn : Bool = false
    @State var isAdmin : Bool = false
    @State var showingPrivacyAdvice : Bool = true
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white

    }

    var body: some View {
       
        TabView{
        
            
            CoursesView().tabItem{
                Image(systemName: "hand.point.up.left")
                Text("Cursos")
            }

            DictionaryView(userId: $userId).tabItem{
                Image(systemName: "book")
                    
                    
                Text("Diccionario")
            }
            
            InfoView().tabItem {
                Image(systemName: "info.circle.fill")
                Text("Info")
                
            }
            
        }.accentColor(Color("MidnightGreen")).onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }.onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
        
    }
       
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
