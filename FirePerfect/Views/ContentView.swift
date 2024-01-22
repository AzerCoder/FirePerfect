//
//  ContentView.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 20/01/24.
//

import SwiftUI

struct ContentView: View {
   
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack {
            if self.session.session != nil {
                HomeView()
            }else{
                SignInView()
            }
        }.onAppear(){
            session.listen()
        }
       
    }
}
#Preview {
    ContentView().environmentObject(SessionStore())
}
