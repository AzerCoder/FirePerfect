//
//  PostCell.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 22/01/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct PostCell: View {
    var post: Post
    var body: some View {
        HStack {
            if post.imgUrl != nil{
                WebImage(url: URL(string: post.imgUrl!))
                    .frame(width: 100,height: 100)
                    .cornerRadius(20)
            }else{
                Image("profile").resizable()
                    .frame(width: 100,height: 100)
                    .cornerRadius(20)
            }
            VStack(alignment:.leading){
                HStack{
                    Text(post.firstname!)
                    Text(post.lastname!)
                }.bold().foregroundColor(.red)
                    .padding(.bottom,5)
                Text(post.phone!)
            }
        }
    }
}

#Preview {
    PostCell(post: Post(firstname: "Azamjon", lastname: "Abdumuxtorov", phone: "939989980"))
}
