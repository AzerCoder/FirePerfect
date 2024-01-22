//
//  HomeView.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 22/01/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionStore
    @State var isLoading = false
    func doLogOut(){
        isLoading = true
        if SessionStore().signOut(){
            isLoading = false
            session.listen()
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                if session.session != nil{
                    Text((session.session?.email)!)
                }
                
                if isLoading{
                    ProgressView()
                }
                
            }
            .navigationBarItems(trailing: HStack{
                Image(systemName: "rectangle.stack.badge.plus")
                Button(action: {
                    doLogOut()
                }, label: {
                    Image(systemName: "arrow.right.doc.on.clipboard")
                })
                
            })
            .navigationBarTitle("Posts",displayMode: .inline)
        }
    }
}

#Preview {
    HomeView().environmentObject(SessionStore())
}
