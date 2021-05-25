//
//  Coordinator.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import UIKit

protocol Coordinator: AnyObject {
    func didDeinit(_ coordinator: Coordinator)
    func start()
}
