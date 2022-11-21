//
//  AdminView.swift
//
//  Created by Adrian Faz on 15/11/22.
//

import SwiftUI

struct AdminView: View {
    
    @Binding var userId: String
    @Binding var isLoggedIn: Bool
    @State private var showingAlert = false
    @State private var searchText = ""
    
    @State var admin : AdminInfo = AdminInfo(fullName: "", numUsers: "", userList: [AdminInfo.userData(userId: "", courseProgress: 0, fullName: "")])

    var body: some View {
        NavigationView{
        VStack{
    VStack{
        HStack{
        Image("ProfileImage")
            .resizable()
            .scaledToFit()
            .frame(width:60)
            .padding(.top, 10)
            .padding(.trailing, 25)
        
            VStack{
                Text(admin.fullName)
            .foregroundColor(.white)
            .font(.system(size: 24, weight: .bold))
            .padding(.top, 20)
  
            Text("Administrador")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .thin))
            }
            
        }.padding(.top, 40)
            .padding(.bottom, 10)
        
        HStack{
            Image("iconoAdminProfile")
                .padding(.trailing, 5)
                .padding(.leading, 10)
            Text(" \(admin.numUsers) usuarios")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .light))
                      
            Spacer()

        }.padding(.leading, 30)
        
    }.frame(width: 440, height: 210)
        .background(Color("MidnightGreen"))
        .cornerRadius(35)
        .ignoresSafeArea()
            
            
            
            
            Text("Información de Usuarios")
                .padding(.trailing,140)
            
            
            
                

            ScrollView{
                ForEach(admin.userList) {
                     usuario in
                    NavigationLink(destination: UserDetailView(detailId: usuario.userId)){
                    
                    AdminUserView(name: usuario.fullName, progress: usuario.courseProgress)
                    }
                    
                }
                }
   
            
                
           
            
            
            Button {
                showingAlert = true
                
            } label: {
                Text("Cerrar Sesión")
                    .padding(.horizontal,70)
                    .padding(.vertical, 10)
                    .font(.system(size: 22, weight: .semibold))
                    .background(Color("MidnightGreen"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top, 35)
                    .padding(.bottom, 20)
            }.alert(isPresented:$showingAlert) {
                Alert(
                    title: Text("¿Seguro que quieres cerrar sesión?").font(.system(size: 15, weight: .light)),
                    message: Text("No podras guardar tu progreso").font(.system(size: 15, weight: .light)),
                    primaryButton: .destructive(Text("Cerrar Sesión").font(.system(size: 15, weight: .light))) {
                        userLogOut()
                    },
                    secondaryButton: .cancel(Text("Cancelar").font(.system(size: 15, weight: .light)))
                )
            }
            Spacer()
            
            }
               
            
        }.onAppear{
            Task{
                await fetchAdminInfo()
            }
      
        }
    
    }
    
    func fetchAdminInfo() async {
        
        let urlString = "http://127.0.0.1:5000/user/admin/\(userId)/info"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async{
                
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(AdminInfo.self, from: data)
                    admin = decodedData
                }catch{
                            print(userId)
                            print("Error!")
                    }
                }
            }
        }.resume()
    }
    
    func userLogOut(){
        userId = ""
        isLoggedIn = false
    }
    
    
}

struct AdminUserView: View{
    
    var name: String
    var progress: Int
    
    
    var body: some View {
    
HStack {
    Image("ProfileImage")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
        .padding(.horizontal, 15)
        .padding(.trailing,2)

    VStack (alignment: .leading){
    Text(name)
        .foregroundColor(.white)
        .font(.system(size: 18, weight: .bold))
        .frame(width: 180, alignment: .leading)
        
        

        
        
        ProgressView(value: Float(progress), total: 100)
            .accentColor(Color("MidnightGreen"))
            .background(.white)
            .cornerRadius(5)
        .scaleEffect(x: 1, y: 2.5)

        .frame(width: 180)
        

    }
    
    Text("\(progress)%")
        .foregroundColor(.white)
        .padding(.leading, 15)
    

    
    Spacer()
}.frame(width: 350, height: 100)
    .background(Color("CadetBlue")
                    .cornerRadius(20))
    .navigationBarHidden(true)
    
    }
    
}


struct AdminInfo: Decodable  {
    var fullName: String
    var numUsers: String
    var userList: [userData]
    
    struct userData: Decodable, Identifiable{
        var id: UUID{
            UUID()
        }
        var userId: String
        var courseProgress: Int
        var fullName: String
    }
        
    }
    
