//
//  check.swift
//  Navigation
//
//  Created by Igor Guzei on 28.12.2022.
//

import UIKit
//import RegexBuilder

enum errors: Error {
    case loginEmpty
    case passwordEmpty
    case notEmail
    case password(Int)
}

public func trim(_ testString: String) -> String {
    print(#fileID, #function)
    if let string = testString.firstMatch(of: /^\s*(\S?.*\S?)\s*$/) {
        return String(string.1)
    } else {
        print("Error")                                                              // TODO: обработка ошибки. Хотя вроде быть не должно.
        return ""
    }
}

public func checkEmail(_ testString: String) -> Bool {
    testString.firstMatch(of: /^[a-z0-9][-._a-z0-9]{0,20}@[a-z0-9][-.a-z0-9]{0,30}[a-z0-9].[a-z]{2,8}$/.ignoresCase()) != nil
}

public func checkPassword(_ testString: String) -> Bool {
    testString.count >= passwordLengthMin
}

public func checkLoginField(_ testString: String) throws -> String {
    print(#fileID, #function)
    let login = trim(testString)
    guard !login.isEmpty      else { throw errors.loginEmpty }
    guard checkEmail(login)   else { throw errors.notEmail}
    return login                                                                    // возможно произошла очистка от случайных ведущих пробелов
}

public func checkPasswordField(_ testString: String) throws -> String {
    print(#fileID, #function)
    let password = trim(testString)
    guard !password.isEmpty       else { throw errors.passwordEmpty }
    guard checkPassword(password) else { throw errors.password(password.count) }
    return password
}
