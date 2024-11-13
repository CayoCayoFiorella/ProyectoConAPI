//
//  User.swift
//  Examen
//
//  Created by Fiorella on 13/11/24.
//

import Foundation
struct User: Decodable, Identifiable, Hashable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: URL
}
