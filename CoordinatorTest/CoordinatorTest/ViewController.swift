//
//  ViewController.swift
//  CoordinatorTest
//
//  Created by Paul Hudson on 03/04/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }

    @IBAction func createTapped(_ sender: Any) {
    }

}

