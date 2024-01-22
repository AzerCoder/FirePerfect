//
//  PostCell.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 22/01/24.
//

import SwiftUI

struct PostCell: View {
    var post: Post
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text(post.firstname!)
                Text(post.lastname!)
            }.bold().foregroundColor(.red)
            Text(post.phone!)
        }
    }
}

#Preview {
    PostCell(post: Post(firstname: "Azamjon", lastname: "Abdumuxtorov", phone: "939989980"))
}
