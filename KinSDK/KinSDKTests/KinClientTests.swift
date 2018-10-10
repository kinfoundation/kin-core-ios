//
//  KinTestHostTests.swift
//  KinTestHostTests
//
//  Created by Kin Foundation
//  Copyright © 2017 Kin Foundation. All rights reserved.
//

import XCTest
@testable import KinCoreSDK
@testable import StellarKit

class KinClientTests: XCTestCase {
    var kinClient: KinClient!
    override func setUp() {
        super.setUp()
        
        kinClient = KinClient(with: URL(string: "http://localhost:8000")!, networkId: .custom(issuer: "GBSJ7KFU2NXACVHVN2VWQIXIV5FWH6A7OIDDTEUYTCJYGY3FJMYIDTU7", stellarNetworkId: .custom("private testnet")))
        
    }

    override func tearDown() {
        super.tearDown()

        kinClient.deleteKeystore()
    }

    func test_account_creation() {
        var e: Error? = nil
        var account: KinAccount? = nil

        XCTAssertNil(account, "There should not be an existing account!")

        do {
            account = try kinClient.addAccount()
        }
        catch {
            e = error
        }

        XCTAssertNotNil(account, "Creation failed: \(String(describing: e))")
    }

    func test_delete_account() {
        do {
            let account = try kinClient.addAccount()

            try kinClient.deleteAccount(at: 0)

            XCTAssertNotNil(account)
            XCTAssertNil(kinClient.accounts[0])
        }
        catch {
            XCTAssertTrue(false, "Something went wrong: \(error)")
        }
    }

    func test_account_instance_reuse() {
        do {
            let _ = try kinClient.addAccount() as? KinStellarAccount

            let first = kinClient.accounts[0] as? KinStellarAccount
            let second = kinClient.accounts[0] as? KinStellarAccount

            XCTAssertNotNil(second)
            XCTAssert(first === second!)
        }
        catch {
            XCTAssertTrue(false, "Something went wrong: \(error)")
        }
    }

}
