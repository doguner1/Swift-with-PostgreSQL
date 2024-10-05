import SwiftUI

struct AuthButton: View {
    let title: String
    let onTap: () -> Void
    
    @Environment(\.isEnabled) private var isEnabled
    
    private var bacgroundColor: Color {
        return isEnabled ? .blue : Color.white.opacity(0.3)
    }
    
    private var textColor: Color {
        return isEnabled ? Color.white : Color.gray
    }
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            Text(title).font(.system(size: 20))
                .foregroundStyle(textColor)
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color(Color(bacgroundColor)).opacity(0.75))
                .cornerRadius(10)
        }.padding(.horizontal,25)
            .padding(.top,25)

    }
}

#Preview {
    ZStack{
        Color.teal
        AuthButton(title: "Login"){
            
        }
    }
    
}
