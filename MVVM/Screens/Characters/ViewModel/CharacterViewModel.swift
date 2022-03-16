//
//  CharacterViewModel.swift
//  MVVM
//
//  Created by Владислав Клепиков on 16.03.2022.
//

import Foundation

class CharacterViewModel {
    private var APIServiceObj: APIService!
    private var chars = [Character]()
    
    init() {
        APIServiceObj = APIService()
    }
    
    public func getCharacters(onComplete: @escaping() -> ()) -> Void {
        APIServiceObj.getCharacterData { chars, error in
            if let c = chars {
                self.chars = c
                onComplete()
            }
        }
    }
    
    public func getNumberOfRows() -> Int {
        return chars.count
    }
    
    public func titleForCellLabel(at indexPath: IndexPath) -> String {
        return chars[indexPath.row].name
    }
}
