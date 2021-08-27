//
//  PasswordManager.swift
//  PasswordGenerator
//
//  Created by Miroslav Mali on 25.8.21..
//

import Foundation

class PasswordManager: ObservableObject {
    
    @Published var includeNumbers = false
    @Published var includeCharacters = false
    
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    let specialCharacters = ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "*", "."]
    
    var password: String = ""
    
    func generatePassword() -> String {
        
        password = ""
        
        if includeNumbers == false && includeCharacters == false {
            for _ in 1...5 {
                password += letters.randomElement()!
            }
        }
        else if includeNumbers && includeCharacters == false {
            for _ in 1...4 {
                password += letters.randomElement()!
                password += numbers.randomElement()!
            }
        }
        else if includeNumbers == false && includeCharacters {
            for _ in 1...4 {
                password += letters.randomElement()!
                password += specialCharacters.randomElement()!
            }
        }
        else if includeNumbers && includeCharacters {
            for _ in 1...3 {
                password += letters.randomElement()!
                password += numbers.randomElement()!
                password += specialCharacters.randomElement()!
            }
        }
        return password
    }
}
