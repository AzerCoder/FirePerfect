//
//  AddPostView.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 22/01/24.
//

import SwiftUI

struct AddPostView: View {
    @ObservedObject var database = RealtimeStore()
    @Environment(\.presentationMode) var presentation
    @State var firstname = ""
    @State var lastname = ""
    @State var phone = ""
    @State var isLoading = false
    
    func addNewPost(){
        isLoading = true
        let post = Post(firstname: firstname, lastname: lastname, phone: phone)
        database.storePost(post: post, completion: { success in
            isLoading = false
            print(success)
            if success{
                self.presentation.wrappedValue.dismiss()
            }
        })
    }
    
    var body: some View {
        ZStack{
            VStack{
                TextField("Firstname", text: $firstname)
                    .frame(height: 50).padding(.leading)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(20)
                TextField("Lastname", text: $lastname)
                    .frame(height: 50).padding(.leading)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(20)
                TextField("Phone", text: $phone)
                    .frame(height: 50).padding(.leading)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(20)
                Button(action: {
                    addNewPost()
                }, label: {
                    Text("Add")
                        .frame(width: 360,height: 45)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                })
                Spacer()
            }.padding()
            if isLoading{
                ProgressView()
            }
        }
        .navigationBarTitle("Add contact")
    }
}

#Preview {
    AddPostView()
}
