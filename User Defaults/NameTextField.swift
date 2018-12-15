//
//  NameTextField.swift
//  User Defaults
//
//  Created by Charles Martin Reed on 12/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class NameTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
    }
    
    private func setupTextField() {
        frame = CGRect(x: 30, y: 336, width: 315, height: 50)
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .roundedRect
        tintColor = Colors.darkGray
        textColor = Colors.darkGray
        font = UIFont.boldSystemFont(ofSize: 28)
        backgroundColor = .white
    }
}
