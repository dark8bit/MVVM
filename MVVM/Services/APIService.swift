//
//  APIService.swift
//  MVVM
//
//  Created by Владислав Клепиков on 16.03.2022.
//

import Foundation

class APIService {
    private let domen = "https://detectiveconanapi.herokuapp.com"

    public func getCharacterData(onCompletion: @escaping([Character]?, Error?) -> ()) -> Void {
        let url = URL(string: "\(domen)/characters")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, resp, error in
            if let error = error {
                onCompletion(nil, error)
            }
            
            if let decodedJSONData = try? JSONDecoder().decode(Characters.self, from: data!) {
                onCompletion(decodedJSONData.characters, nil)
            }
        }
        
        task.resume()
    }
}
