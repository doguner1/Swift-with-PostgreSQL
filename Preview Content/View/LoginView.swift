//
//  LoginView.swift
//  PostgreSQL&Node.JS
//
//  Created by qwerty on 5.10.2024.
//

import SwiftUI

struct LoginView: View {
    @State var authScreenModel = RegisterViewModel()
    @AppStorage("login") var LoginCntrl: Int = 0
    @AppStorage("viewControl") var viewControl: Int = 0
    
    var body: some View {
        VStack{
            
            if LoginCntrl == 0 {
                UserView
                    .padding(.horizontal,25)
                    .padding(.top,30)
            }else{
                LoginView
                    .padding(.horizontal,25)
                    .padding(.top,25)
            }
            
            
            VStack(alignment:.leading ,spacing: 15){
                Text("Parola").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $authScreenModel.password)
                
                Button(action: {}){
                    Text("Parolamı Unuttum").font(.system(size: 15))
                        .foregroundColor(Color("Renk1"))
                }.padding(.top,10)
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
            
            AuthButton(title: "Oturum Aç"){
                viewControl = 1
                LoginCntrl = 0
                authScreenModel.login()
            }
            
            
            
            Button(action:{}) {
                HStack(spacing: 35){
                    Image(systemName: "faceid").font(.system(size: 26)).foregroundColor(Color("Renk1"))
                    Text("Face ID ile oturum aç").font(.system(size: 20)).fontWeight(.bold).foregroundColor(Color("Renk1"))
                    Spacer()
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color("Renk1"),lineWidth: 1))
            }
            .padding(.top,30)
            .padding(.horizontal,25)
            
        }//Vstack
        
    }
}


#Preview {
    LoginView()
}

extension LoginView {
    private var UserView: some View{
        HStack{
            VStack(alignment: .leading){
                
                Text("Tekrar Merhaba").fontWeight(.bold).opacity(0.80)
                Text("Doğu").font(.title).fontWeight(.bold)
                    .opacity(0.90)
                
                Button(action: {
                    LoginCntrl = 1
                }){
                    Text("Bu ben değilim")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Renk1"))
                        .padding(.top,4)
                }
            }//Vstack
            Spacer(minLength: 0)
            
            Image("KisiProfil1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height: 100)
                .clipShape(Circle())
        }//Hstack
    }
}

extension LoginView {
    private var LoginView: some View{
        VStack(alignment:.leading ,spacing: 15){
            Text("Email").font(.caption).fontWeight(.bold).foregroundColor(.gray)
            CustomTF(sfIcon: "at", hint: "Email ID", value: $authScreenModel.email)
        }//Vstack Paralo
    }
}
