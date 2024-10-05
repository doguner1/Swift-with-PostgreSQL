import SwiftUI

struct LoginHomeView: View {
    @State var index = 0
    @Namespace var name
    
    var body: some View {
        VStack{
            //Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 70,height: 70)
            
            HStack(spacing: 0){
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        index = 0
                    }
                    
                }, label: {
                    VStack{
                        Text("Giriş Yap").font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 0 ? Color(.label).opacity(0.85) : .gray)
                        
                        ZStack{
                            Capsule().fill(Color.black.opacity(0.04))
                                .frame(height: 5)
                            
                            if index == 0 {
                                Capsule().fill(Color("Renk1")).frame(height: 5)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                })
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        index = 1
                    }
                    
                }, label: {
                    VStack{
                        Text("Kayıt Ol").font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 1 ? Color(.label).opacity(0.85) : .gray)
                        
                        ZStack{
                            Capsule().fill(Color.black.opacity(0.04))
                                .frame(height: 5)
                            
                            if index == 1 {
                                Capsule().fill(Color("Renk1")).frame(height: 5)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                })
            }.padding(.top,30)
                
                if index == 0{
                    LoginView()
                }else{
                    SignUp(authScreenModel: RegisterViewModel())
                }

        }
    }
}

#Preview {
    LoginHomeView()
}
