//
//  KinError.swift
//  KinSDK
//
//  Created by Kin Foundation
//  Copyright © 2017 Kin Foundation. All rights reserved.
//

import Foundation

/**
 Operations performed by the KinSDK that throw errors might throw a `KinError`; alternatively,
 errors in completion blocks might be of this type.
 */
public enum KinError: Error {
    /**
     Account creation failed.
     */
    case accountCreationFailed (Error)

    /**
     Account deletion failed.
     */
    case accountDeletionFailed (Error)

    /**
     Account activation failed.
     */
    case activationFailed (Error)

    /**
     Sending a payment failed.
     */
    case paymentFailed (Error)

    /**
     Querying for the account balance failed.
     */
    case balanceQueryFailed (Error)

    /**
     Amounts must be greater than zero when trying to transfer Kin. When sending 0 Kin, this error
     is thrown.
     */
    case invalidAmount

    /**
     Thrown when trying to use an instance of `KinAccount` after `deleteAccount(:)` has been called.
     */
    case accountDeleted

    /**
     An internal error happened in the KinSDK.
     */
    case internalInconsistency

    /**
     An unknown error happened.
     */
    case unknown
}

extension KinError: LocalizedError {
    /// :nodoc:
    public var errorDescription: String? {
        switch self {
        case .accountCreationFailed:
            return "Account creation failed"
        case .accountDeletionFailed:
            return "Account deletion failed"
        case .activationFailed:
            return "Account activation failed"
        case .paymentFailed:
            return "Payment failed"
        case .balanceQueryFailed:
            return "Balance query failed"
        case .invalidAmount:
            return "Invalid Amount"
        case .accountDeleted:
            return "Account Deleted"
        case .internalInconsistency:
            return "Internal Inconsistency"
        case .unknown:
            return "Unknown Error"
        }
    }
}
