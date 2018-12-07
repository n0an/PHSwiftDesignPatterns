//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Paul Hudson on 03/04/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
