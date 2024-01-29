//
//  AddPostView.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 22/01/24.
//
import Foundation
import SwiftUI

struct AddPostView: View {
    @ObservedObject var database = RealtimeStore()
    @ObservedObject var storage = StorageStore()
    @Environment(\.presentationMode) var presentation
    @State var firstname = ""
    @State var lastname = ""
    @State var phone = ""
    @State var isLoading = false
    
    @State var defImage = UIImage(imageLiteralResourceName: "profile")
    @State var pickedImage: UIImage? = nil
    @State var showImagePicker: Bool = false
    
    func addNewPost(urlString: String){
        let post = Post(firstname: firstname, lastname: lastname, phone: phone,imgUrl: urlString)
        database.storePost(post: post, completion: { success in
            isLoading = false
            print(success)
            if success{
                self.presentation.wrappedValue.dismiss()
            }
        })
    }
    
    func uploadImage(){
        isLoading = true
        storage.uploadImage(pickedImage!, completion: { downloadURL in
            let urlString = downloadURL?.absoluteString
            print(urlString!)
            addNewPost(urlString: urlString!)
        })
    }
    
    var body: some View {
        ZStack{
            VStack{
                Button(action: {
                    self.showImagePicker.toggle()
                }, label: {
                    Image(uiImage: pickedImage ?? defImage).resizable().frame(height: 100).frame(width: 100).scaledToFit()
                        .cornerRadius(20)
                        .shadow(radius: 10) 
                })
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    self.showImagePicker = false
                }, content: {
                    ImagePicker(image: self.$pickedImage, isShown: self.$showImagePicker)
                })
                
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
//                    addNewPost()
                    uploadImage()
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
