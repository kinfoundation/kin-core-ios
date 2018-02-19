//
//  NetworkId.swift
//  KinSDK
//
//  Created by Kin Foundation
//  Copyright © 2017 Kin Foundation. All rights reserved.
//

import Foundation

/**
 `NetworkId` represents the block chain network to which `KinClient` will connect.
 */
public enum NetworkId {
    /**
     A production node.
     */
    case mainNet

    /**
    The Stellar test net.
     */
    case testNet

    /**
     A network with a custom ID. **Currently unsupported**
     */
    case custom(issuer: String, stellarNetworkId: String)
}

extension NetworkId {
    public var issuer: String {
        switch self {
        case .mainNet:
            return "GAQ4HYZJ5PSYBMHXAX75DKN4YGHFIEGZYBDTGFV7ZHYGQWVGFHOW75CB"
        case .testNet:
            return "GCKG5WGBIJP74UDNRIRDFGENNIH5Y3KBI5IHREFAJKV4MQXLELT7EX6V"
        case .custom (let issuer, _):
            return issuer
        }
    }

    public var stellarNetworkId: String {
        switch self {
        case .mainNet:
            return "Public Global Stellar Network ; September 2015"
        case .testNet:
            return "Test SDF Network ; September 2015"
        case .custom(_, let stellarNetworkId):
            return stellarNetworkId
        }
    }
}

extension NetworkId: CustomStringConvertible {
    /// :nodoc:
    public var description: String {
        switch self {
        case .mainNet:
            return "main"
        case .testNet:
            return "test"
        default:
            return "custom network"
        }
    }
}

extension NetworkId: Equatable {
    public static func ==(lhs: NetworkId, rhs: NetworkId) -> Bool {
        switch lhs {
        case .mainNet:
            switch rhs {
            case .mainNet:
                return true
            default:
                return false
            }
        case .testNet:
            switch rhs {
            case .testNet:
                return true
            default:
                return false
            }
        default:
            return false
        }
    }
}
