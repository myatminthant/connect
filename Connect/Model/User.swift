//
//  User.swift
//  Connect
//
//  Created by Lin Myat on 20/08/2021.
//

import Foundation

class User {
    var name = String()
    var email = String()
    var image = String()
    
    init(dict: [String: Any]) {
        name = dict["name"] as? String ?? ""
        email = dict["email"] as? String ?? ""
        image = dict["image"] as? String ?? ""
    }
}


