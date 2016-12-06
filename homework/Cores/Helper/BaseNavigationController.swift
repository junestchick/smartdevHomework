//
//  BaseNavigationController.swift
//  homework
//
//  Created by Dũng Trần on 12/6/16.
//  Copyright © 2016 Junest. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    fileprivate func setup() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor(colorLiteralRed: 1, green: 82/255, blue: 149/255, alpha: 1)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationBar.backItem?.title = ""
    }
}
