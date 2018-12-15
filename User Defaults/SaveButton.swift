//
//  SaveButton.swift
//  User Defaults
//
//  Created by Charles Martin Reed on 12/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class SaveButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSaveButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSaveButton()
    }
    
    private func setupSaveButton() {
        frame = CGRect(x: 30, y: 406, width: 315, height: 50)
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        setTitle("SAVE", for: .normal)
        backgroundColor = Colors.lightBlue
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        layer.cornerRadius = frame.size.height / 2
    }
}
