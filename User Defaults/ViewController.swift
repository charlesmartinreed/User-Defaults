//
//  ViewController.swift
//  User Defaults
//
//  Created by Charles Martin Reed on 12/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- UI Properties
    var segControl: CustomSegControl!
    var petImageView: PetImageView!
    var nameTextField: NameTextField!
    var saveButton: SaveButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Property inits
        let segItems = ["Light", "Dark"]
        segControl = CustomSegControl(items: segItems)
        
        petImageView = PetImageView(image: UIImage(named: "harper"))
        nameTextField = NameTextField()
        saveButton = SaveButton()
        
        //add subViews
        view.addSubview(segControl)
        view.addSubview(petImageView)
        view.addSubview(nameTextField)
        view.addSubview(saveButton)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        //constraints
        var constraints = [[NSLayoutConstraint]]()
        
        let segmentConstraints = [
            segControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            segControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            segControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            segControl.heightAnchor.constraint(equalToConstant: 32)]
        //            segControl.bottomAnchor.constraint(equalTo: petImageView.topAnchor, constant: 30)]
        constraints.append(segmentConstraints)
        //NSLayoutConstraint.activate(segmentConstraints)
        
        let imageViewConstraints = [
            petImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            petImageView.widthAnchor.constraint(equalToConstant: 160),
            petImageView.heightAnchor.constraint(equalToConstant: 160),
            petImageView.topAnchor.constraint(equalTo: segControl.bottomAnchor, constant: 30)]
        constraints.append(imageViewConstraints)
        //NSLayoutConstraint.activate(imageViewConstraints)
        
        let textFieldConstraints = [
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameTextField.topAnchor.constraint(equalTo: petImageView.bottomAnchor, constant: 30)]
        constraints.append(textFieldConstraints)
        //NSLayoutConstraint.activate(textFieldConstraints)
        
        let saveButtonConstraints = [
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30)]
        constraints.append(saveButtonConstraints)
        //NSLayoutConstraint.activate(saveButtonConstraints)
        
        constraints.forEach { (constraint) in
            NSLayoutConstraint.activate(constraint)
        }
    }


}

