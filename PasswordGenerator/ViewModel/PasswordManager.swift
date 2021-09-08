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
    @Published var sliderValue: Double = 8
    
    // Letters only are included by default
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    // Numbers and special chars are included by user preference
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    let specialCharacters = ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "*", "."]
    
    var password: String = ""
    
    func generatePassword() -> String {
        // Function that manages the password string
        
        // Resets the password string
        password = ""
        
        var i = 0
        
        // For loop to fill password string with characters
        for _ in 1...Int(sliderValue) {
            
            // Adds letters
            password += letters.randomElement()!
            
            // Adds numbers (if selected)
            if includeNumbers {
                password += numbers.randomElement()!
            }
            
            // Adds special characters (if selected)
            if includeCharacters {
                // Reduces the number of spec characters by half
                if i % 2 == 0 {
                    password += specialCharacters.randomElement()!
                }
            }
            i += 1
        }
        
        // Sets the selected password length
        if includeNumbers || includeCharacters {
            password.removeLast(password.count - Int(sliderValue))
        }
        
        // Returns the password as shuffled string
        return String(password.shuffled())
    }
}
