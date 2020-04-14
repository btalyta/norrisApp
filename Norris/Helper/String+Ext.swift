//
//  String+Ext.swift
//  Norris
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import UIKit

extension String {
    func addLineSpacing(_ spacing: CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        let attributedString = NSAttributedString(string: self,
                                                  attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return attributedString
    }
}
