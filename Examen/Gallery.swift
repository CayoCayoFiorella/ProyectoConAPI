//
//  Gallery.swift
//  Examen
//
//  Created by Fiorella on 13/11/24.
//

import Foundation

struct Galeria: Identifiable, Codable {
    let id: Int
    let nombre: String
    let autor: String
    let url_imagen: String
}

struct Pintura: Identifiable, Codable {
    let id: Int
    let titulo: String
    let artista: String
    let año: String
    let tecnica: String
    let descripcion: String
    let url_imagen: String
    let id_galeria: Int
}
