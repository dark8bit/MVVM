//
//  Character.swift
//  MVVM
//
//  Created by Владислав Клепиков on 16.03.2022.
//

import Foundation

struct Characters: Decodable {
    var characters: [Character]
}

struct Character: Decodable {
    let name: String
    let url: String
    let characterimageurl: String
    let voiceactorimageurl: String
    let voiceactor: String
}
