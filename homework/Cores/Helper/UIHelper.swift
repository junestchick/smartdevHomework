//
//  UIHelper.swift
//  homework
//
//  Created by Dũng Trần on 12/6/16.
//  Copyright © 2016 Junest. All rights reserved.
//

import UIKit

class UIHelper: NSObject {
    class func showAlert(withMessage message: String, inViewController controller: UIViewController) {
        let alertVC = UIAlertController(title: "SmartDev", message: message, preferredStyle: .alert)
        let actionConfirm = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alertVC.addAction(actionConfirm)
        controller.present(alertVC, animated: true, completion: nil)
    }
}
