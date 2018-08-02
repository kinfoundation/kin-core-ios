//
//  KinAccountTableViewCell.swift
//  KinSampleApp
//
//  Created by Kin Foundation
//  Copyright © 2017 Kin Foundation. All rights reserved.
//

import UIKit
import KinCoreSDK

class KinAccountTableViewCell: KinClientCell {
    @IBOutlet weak var addressLabel: UILabel!

    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!

    override var kinAccount: KinAccount! {
        didSet {
            showAddress()
        }
    }

    @IBAction func revealKeyStore(_ sender: Any) {
        kinClientCellDelegate?.revealKeyStore()
    }

    @IBAction func copyAddress(_ sender: Any) {
        UIPasteboard.general.string = addressLabel.text
    }

    func showAddress() {
        addressLabel.text = kinAccount.publicAddress
    }
}
