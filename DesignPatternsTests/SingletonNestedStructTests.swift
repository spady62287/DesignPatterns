//
//  SingletonNestedStructTests.swift
//  DesignPatternsTests
//
//  Created by Daniel Spady on 2021-02-27.
//

import XCTest
@testable import DesignPatterns

class SingletonNestedStructTests: XCTestCase {
    
    func testSharedInstanceIsNotNil() {
        let instance = SingletonNestedStruct.sharedInstance
        XCTAssertNotNil(instance, "")
    }
    
    func testSharedInstanceIsUnique() {
        let instance1 = SingletonNestedStruct()
        let instance2 = SingletonNestedStruct.sharedInstance
        XCTAssertFalse(instance1 === instance2)
    }
    
    func testSharedInstanceIsTrueTwice() {
        let instance1 = SingletonNestedStruct.sharedInstance
        let instance2 = SingletonNestedStruct.sharedInstance
        XCTAssertTrue(instance1 === instance2)
    }

    func testSharedInstanceIsThreadSafe() {
        var instance1: SingletonNestedStruct!
        var instance2: SingletonNestedStruct!
        
        let expectation1 = expectation(description: "Instance 1")
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            instance1 = SingletonNestedStruct.sharedInstance
            expectation1.fulfill()
        }
        let expectation2 = expectation(description: "Instance 2")
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            instance2 = SingletonNestedStruct.sharedInstance
            expectation2.fulfill()
        }

        waitForExpectations(timeout: 1.0) { (_) in
            XCTAssertTrue(instance1 === instance2)
        }
    }
}
