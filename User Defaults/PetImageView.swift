//
//  PetImageView.swift
//  User Defaults
//
//  Created by Charles Martin Reed on 12/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class PetImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPetImageView()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        setupPetImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPetImageView()
    }
    
    private func setupPetImageView() {
        frame = CGRect(x: 108, y: 146, width: 160, height: 160)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = self.frame.size.height / 2 //should make this a circle
        clipsToBounds = true
    }
}
