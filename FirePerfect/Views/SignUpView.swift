//
//  SignUpView.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 22/01/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentation
    @State var email = ""
    @State var name = ""
    @State var pasword = ""
    @State var isLoading = false
    
    func doSignUp(){
        isLoading = true
        SessionStore().signUp(email:email,password: pasword,handler: {(res,err) in
            isLoading = false
            if err != nil{
                print("User not created")
                return
            }
            print("User created")
            presentation.wrappedValue.dismiss()
        })
    }
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    Spacer()
                    Text("Create your account").font(.system(size: 30))
                        .foregroundColor(.red)
                    TextField("Fullname:", text: $name)
                        .frame(height: 45).padding(.leading,10)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(20)
                    TextField("Email:", text: $email)
                        .frame(height: 45).padding(.leading,10)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(20)
                    SecureField("Password:", text: $pasword)
                        .frame(height: 45).padding(.leading,10)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(20)
                    Button(action: {
                        doSignUp()
                    }, label: {
                        Text("Sign Up")
                            .frame(width: 360,height: 45)
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(20)
                    })
                    Spacer()
                    HStack{
                        Text("Already have an account?")
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }, label: {
                            Text("Sign In")
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
    SignUpView()
}
