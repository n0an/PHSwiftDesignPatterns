//
//  ViewController.swift
//  MVVMTest
//
//  Created by Anton Novoselov on 22/03/2018.
//  Copyright © 2018 Anton Novoselov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: BoundTextField!
    
    var user = User(name: Observable("Anton Novoselov"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.bind(to: user.name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.user.name.value = "xxx"
        }
    }

    


}

