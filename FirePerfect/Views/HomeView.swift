//
//  HomeView.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 22/01/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var database = RealtimeStore()
    @EnvironmentObject var session: SessionStore
    @State var isLoading = false
    
    func doLogOut(){
        isLoading = true
        if SessionStore().signOut(){
            isLoading = false
            session.listen()
        }
    }
    
    func apiPosts(){
        isLoading = true
        database.loadPosts {
            isLoading = false
            print(database.items.count)
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(database.items, id:\.self){ item in
                        PostCell(post: item)
                    }
                }.listStyle(PlainListStyle())
                
                if isLoading{
                    ProgressView()
                }
                
            }
            .navigationBarItems(trailing: HStack{
                NavigationLink(destination: AddPostView(), label: {
                    Image(systemName: "rectangle.stack.badge.plus")
                })
                Button(action: {
                    doLogOut()
                }, label: {
                    Image(systemName: "arrow.right.doc.on.clipboard")
                })
                
            }.foregroundColor(.black)
            )
            .navigationBarTitle("Contact",displayMode: .inline)
        }.onAppear(){
            apiPosts()
        }
    }
}

#Preview {
    HomeView().environmentObject(SessionStore())
}
