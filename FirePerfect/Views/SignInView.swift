//
//  SignInView.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 22/01/24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var session: SessionStore
    @State var email = "azamjon@gmail.com"
    @State var pasword = "1234qwerty"
    @State var isLoading = false
    
    func doSignIn(){
        isLoading = true
        SessionStore().signIn(email: email, password: pasword, handler: {(res,err) in
            isLoading = false
            if err != nil{
                print("Check email or pasword")
                return
            }
            print("User signed in")
            session.listen()
        })
    }
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    Spacer()
                    Text("Welcome Back").font(.system(size: 30))
                        .foregroundColor(.red)
                    TextField("Email:", text: $email)
                        .frame(height: 45).padding(.leading,10)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(20)
                    SecureField("Password:", text: $pasword)
                        .frame(height: 45).padding(.leading,10)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(20)
                    Button(action: {
                        doSignIn()
                    }, label: {
                        Text("Sign In")
                            .frame(width: 360,height: 45)
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(20)
                    })
                    Spacer()
                    HStack{
                        Text("Don't have an account?")
                        NavigationLink(destination: SignUpView(), label: {
                            Text("Sign Up")
                                .foregroundColor(.red)
                        })
                    
                    }
                }.padding()
                
                if isLoading{
                    ProgressView()
                }
            }
        }
    }
}


#Preview {
    SignInView()
}
