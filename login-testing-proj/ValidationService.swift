//
//  ValidationService.swift
//  login-testing-proj
//
//  Created by Ashlei Mitchell on 4/17/22.
//

import Foundation

struct ValidationService {
    func validateEmail(_ email: String?) throws -> String {
        guard let email = email else { throw ValidationError.invalidCredentials }
        guard checkIfValidEmail(input: email) else { throw ValidationError.emailFormatBad }
        return email
    }
    
    func validatePassword(_ password: String?) throws -> String {
        guard let password = password else { throw ValidationError.invalidCredentials }
        guard password.count >= 6 else { throw ValidationError.passwordTooShort }
        guard password.count <= 20 else { throw ValidationError.passwordTooLong }
        return password
    }
    
    func checkIfValidEmail(input: String) -> Bool {
        let range = NSRange(location: 0, length: input.utf16.count)
        let pattern = #"^[A-Za-z0-9]+([\.\-_][A-Za-z0-9]+)*@[A-Za-z0-9]+([\.\-_][A-Za-z0-9]+)*\.[A-Za-z][A-Za-z]+$"#
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        if regex.firstMatch(in: input, options: [], range: range) != nil {
            return true
        }
        return false
    }
}

enum ValidationError: LocalizedError {
    case invalidCredentials
    case emailFormatBad
    case passwordTooShort
    case passwordTooLong
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "You have entered invalid credentials."
        case .emailFormatBad:
            return "You have entered an invalid e-mail address."
        case .passwordTooShort:
            return "Your password must be at least 6 characters."
        case .passwordTooLong:
            return "Your password cannot be more than 20 characters."
        }
    }
}
