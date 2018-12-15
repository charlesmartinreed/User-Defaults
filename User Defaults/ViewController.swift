//
//  ViewController.swift
//  User Defaults
//
//  Created by Charles Martin Reed on 12/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Properties
    var segControl: CustomSegControl!
    var petImageView: PetImageView!
    var nameTextField: NameTextField!
    var saveButton: SaveButton!
    
    let savedLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var isDarkMode = false
    let defaults = UserDefaults.standard
    
    //Sean suggested this a means of avoiding "stringly" typed keys and potential typos
    struct Keys {
        static let prefersDarkMode = "prefersDarkMode"
        static let petName = "petName"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Property inits
        let segItems = ["Light", "Dark"]
        segControl = CustomSegControl(items: segItems)
        segControl.addTarget(self, action: #selector(didChangeStyleSegmentedControl), for: .valueChanged)
        
        petImageView = PetImageView(image: UIImage(named: "harper"))
        nameTextField = NameTextField()
        
        saveButton = SaveButton()
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        savedLabel.font = UIFont.boldSystemFont(ofSize: 36)
        savedLabel.text = "SAVED!"
        savedLabel.frame = CGRect(x: view.frame.height / 2, y: view.frame.width / 2, width: 100, height: 100)
        savedLabel.textColor = UIColor(red: 27/255, green: 186/255, blue: 0/255, alpha: 1)
        savedLabel.alpha = 0 //begins by being hidden
        savedLabel.translatesAutoresizingMaskIntoConstraints = false

        //add subViews
        view.addSubview(segControl)
        view.addSubview(petImageView)
        view.addSubview(nameTextField)
        view.addSubview(saveButton)
        view.addSubview(savedLabel)
        
        setupConstraints()
        
        checkForSavedStylePreference()
        checkForSavedName()
        
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
        
        //constraints
        let labelConstraints = [
            savedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            savedLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 50)]
        constraints.append(labelConstraints)
        
        constraints.forEach { (constraint) in
            NSLayoutConstraint.activate(constraint)
        }
    }
    
    //MARK:- Update style for dark/light mode
    func updateStyle() {
        UIView.animate(withDuration: 0.4) {
            self.view.backgroundColor = self.isDarkMode ? Colors.darkGray : .white
            
            self.nameTextField.updateStyle(isDarkMode: self.isDarkMode)
        }
    }
    
    //MARK:- Action methods for UI elements
    @objc func didChangeStyleSegmentedControl(_ sender: CustomSegControl) {
        isDarkMode = sender.selectedSegmentIndex == 1
        saveStylePreference()
        updateStyle()
        print("clicked \(sender.selectedSegmentIndex)")
    }
    
    @objc func saveButtonTapped() {
        saveName()
        
        UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
            self.savedLabel.alpha = 1
        }) { (_) in
            self.savedLabel.alpha = 0
        }
        
//        UIView.animate(withDuration: 1, animations: {
//            self.savedLabel.alpha = 1
//        }) { (_) in
//            self.savedLabel.alpha = 0
//        }
    }
    
    //MARK:- Save and retrieval methods
    func saveName() {
        guard let name = nameTextField.text else { return }
        defaults.set(name, forKey: Keys.petName)
    }
    
    func checkForSavedName() {
        guard let savedName = defaults.string(forKey: Keys.petName) else { return }
        nameTextField.text = savedName
    }
    
    func saveStylePreference() {
        //saving a boolean for dark mode
        defaults.set(isDarkMode, forKey: Keys.prefersDarkMode)
    }
    
    func checkForSavedStylePreference() {
        //grab from user defaults
        let prefersDarkMode = defaults.bool(forKey: Keys.prefersDarkMode)
        
        if prefersDarkMode {
            isDarkMode = true
            updateStyle()
            segControl.selectedSegmentIndex = 1 //or, dark mode selection
        }
    }

}

