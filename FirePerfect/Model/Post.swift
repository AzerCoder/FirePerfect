//
//  Post.swift
//  FirePerfect
//
//  Created by A'zamjon Abdumuxtorov on 22/01/24.
//

import Foundation

struct Post: Hashable {
    var firstname: String?
    var lastname: String?
    var phone: String?
    
    init(firstname: String?, lastname: String?){
        self.firstname = firstname
        self.lastname = lastname
    }
    
    init(firstname: String?, lastname: String?, phone: String?) {
        self.firstname = firstname
        self.lastname = lastname
        self.phone = phone
    }
}
