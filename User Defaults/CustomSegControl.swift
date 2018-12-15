//
//  CustomSegControl.swift
//  User Defaults
//
//  Created by Charles Martin Reed on 12/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class CustomSegControl: UISegmentedControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSegControl()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        setupSegControl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder)
        setupSegControl()
    }
    
    private func setupSegControl() {
        frame = CGRect(x: 30, y: 84, width: 315, height: 33)
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = Colors.lightBlue
        selectedSegmentIndex = 0 //because we're starting out in "light" mode
    }
    
}
