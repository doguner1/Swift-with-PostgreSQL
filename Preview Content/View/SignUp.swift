import SwiftUI

struct SignUp: View {
    @ObservedObject var authScreenModel: RegisterViewModel
    
    
    var body: some View {
        VStack{
            HStack{//Yan yana
                Text("Hesap Oluştur").font(.title).fontWeight(.bold)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "person.fill").font(.system(size: 30)).padding()
                })
                
            }.padding(.horizontal,25)
                .padding(.top,30)
            
            
            VStack(alignment:.leading ,spacing: 13){
                Text("Email").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                CustomTF(sfIcon: "at", hint: "Email ID", value: $authScreenModel.email)

                Text("Kullanıcı Adı").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                CustomTF(sfIcon: "person", hint: "Username", value: $authScreenModel.username)
                
                Text("Parola").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $authScreenModel.password)
                
                Text("By signing up, you're agreeing to our **[Terms & Condition](https://apple.com)** and **[Privacy Policy](https://apple.com)**")
                    .font(.caption)
                    .tint(.appYellow)
                    .foregroundStyle(.gray)
                    .frame(height: 50)
                
            }.padding(.horizontal,25)
                .padding(.top,5)
            
            AuthButton(title: "Kaydol"){
                authScreenModel.register()
            }
//            .disabled(authScreenModel.disableSignUpButton)
            
            Button(action:{}) {
                HStack(spacing: 35){
                    Image(systemName: "faceid").font(.system(size: 26)).foregroundColor(Color("Renk1"))
                    Text("Face ID ile kaydol").font(.system(size: 20)).fontWeight(.bold).foregroundColor(Color("Renk1"))
                    Spacer()
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color("Renk1"),lineWidth: 1))
            }//Button bitişi
            .padding(.top,30)
            .padding(.horizontal,25)
            
        }
    }

}

#Preview {
    SignUp(authScreenModel: RegisterViewModel())
}