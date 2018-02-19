//
//  KinClient.swift
//  KinSDK
//
//  Created by Kin Foundation
//  Copyright © 2017 Kin Foundation. All rights reserved.
//

import Foundation
import StellarKit

/**
 `KinClient` is a factory class for managing an instance of `KinAccount`.
 */
public final class KinClient {
    /**
     Convenience initializer to instantiate a `KinClient` with a `ServiceProvider`.

     - parameter provider: The `ServiceProvider` instance that provides the `URL` and `NetworkId`.
     */
    public convenience init(provider: ServiceProvider) throws {
        try self.init(with: provider.url, networkId: provider.networkId)
    }

    /**
     Instantiates a `KinClient` with a `URL` and a `NetworkId`.

     - parameter nodeProviderUrl: The `URL` of the node this client will communicate to.
     - parameter networkId: The `NetworkId` to be used.
     */
    public init(with nodeProviderUrl: URL, networkId: NetworkId) throws {
        self.stellar = Stellar(baseURL: nodeProviderUrl,
                               asset: Asset(assetCode: "KIN", issuer: networkId.issuer),
                               networkId: networkId.stellarNetworkId)

        self.accounts = KinAccounts(stellar: stellar)

        self.networkId = networkId
    }

    public var url: URL {
        return stellar.baseURL
    }

    public var accounts: KinAccounts

    internal let stellar: Stellar

    /**
     The `NetworkId` of the network which this client communicates to.
     */
    public let networkId: NetworkId

    /**
     Adds an account associated to this client, and returns it.

     - parameter passphrase: The passphrase to use in order to create the associated account.

     - throws: If creating the account fails.
     */
    public func addAccount(with passphrase: String) throws -> KinAccount {
        do {
            return try accounts.createAccount(with: passphrase)
        }
        catch {
            throw KinError.accountCreationFailed(error)
        }
    }

    /**
     Deletes the account at the given index. This method is a no-op if there is no account at
     that index.

     If this is an action triggered by the user, make sure you let the him know that any funds owned
     by the account will be lost if it hasn't been backed up. See
     `exportKeyStore(passphrase:exportPassphrase:)`.

     - parameter index: The index of the account to delete.
     - parameter passphrase: The passphrase used to create the associated account.

     - throws: If the passphrase is invalid, or if deleting the account fails.
     */
    public func deleteAccount(at index: Int, with passphrase: String) throws {
        do {
            try accounts.deleteAccount(at: index, with: passphrase)
        }
        catch {
            throw KinError.accountDeletionFailed(error)
        }
    }

    /**
     Deletes the keystore.
     */
    public func deleteKeystore() {
        for _ in 0..<KeyStore.count() {
            KeyStore.remove(at: 0)
        }

        accounts.flushCache()
    }
}
