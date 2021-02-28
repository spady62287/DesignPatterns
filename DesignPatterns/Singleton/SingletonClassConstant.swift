//
//  SingletonClassConstant.swift
//  DesignPatterns
//
//  Created by Daniel Spady on 2021-02-27.
//

import Foundation

// lazy initialization because Swift lazily initializes class constants (and variables), and is thread safe by the definition of let.

// Class constants were introduced in Swift 1.2.

class SingletonClassConstant {
    
    static let sharedInstance = SingletonClassConstant()
    
    init() {
        print("SingletonClassConstant")
    }
    
}
