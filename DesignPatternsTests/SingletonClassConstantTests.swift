//
//  SingletonClassConstantTests.swift
//  DesignPatternsTests
//
//  Created by Daniel Spady on 2021-02-27.
//

import XCTest
@testable import DesignPatterns

class SingletonClassConstantTests: XCTestCase {
    
    func testSharedInstanceIsNotNil() {
        let instance = SingletonClassConstant.sharedInstance
        XCTAssertNotNil(instance, "")
    }
    
    func testSharedInstanceIsUnique() {
        let instance1 = SingletonClassConstant()
        let instance2 = SingletonClassConstant.sharedInstance
        XCTAssertFalse(instance1 === instance2)
    }
    
    func testSharedInstanceIsTrueTwice() {
        let instance1 = SingletonClassConstant.sharedInstance
        let instance2 = SingletonClassConstant.sharedInstance
        XCTAssertTrue(instance1 === instance2)
    }

    func testSharedInstanceIsThreadSafe() {
        var instance1: SingletonClassConstant!
        var instance2: SingletonClassConstant!
        
        let expectation1 = expectation(description: "Instance 1")
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            instance1 = SingletonClassConstant.sharedInstance
            expectation1.fulfill()
        }
        let expectation2 = expectation(description: "Instance 2")
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            instance2 = SingletonClassConstant.sharedInstance
            expectation2.fulfill()
        }

        waitForExpectations(timeout: 1.0) { (_) in
            XCTAssertTrue(instance1 === instance2)
        }
    }
}
