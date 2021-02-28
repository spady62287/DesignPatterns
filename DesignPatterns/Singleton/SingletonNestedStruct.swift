//
//  SingletonNestedStruct.swift
//  DesignPatterns
//
//  Created by Daniel Spady on 2021-02-27.
//

import Foundation

// static constant of a nested struct as a class constant.

// workaround for the lack of static class constants in Swift 1.1 and earlier, and still works as a workaround for the lack of static constants and variables in functions.

class SingletonNestedStruct {
    
    class var sharedInstance: SingletonNestedStruct {
        struct Static {
            static let instance: SingletonNestedStruct = SingletonNestedStruct()
        }
        return Static.instance
    }
}
