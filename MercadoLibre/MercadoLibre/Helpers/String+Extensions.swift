//
//  String+Extensions.swift
//  MercadoLibre
//
//  Created by Carlos Pava on 22/05/21.
//

import Foundation

extension String {
  var localized: String {
    return NSLocalizedString(self, comment: "\(self)_comment")
  }
}
