//
//  ProfileViewController.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/27/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    internal let profileInfoObject = ProfileView()
    var userFName: String = ""
    var userLName: String = ""
    var userAge: String = ""
    var userGender: String = ""
    var userCountry: String = ""
    var userEmailID: String = ""

    private let profileInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7768785357, green: 0.7994685173, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "Profile Info"
        let editBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editProfile))
        self.navigationItem.rightBarButtonItem  = editBarButtonItem
        view.backgroundColor = #colorLiteral(red: 0.7768785357, green: 0.7994685173, blue: 1, alpha: 1)
        addSubViews()
        setupAutoLayout()
        textFieldsHidden()
        profileData()
    }
    
    func profileData() {
        profileInfoObject.firstNameTF.text = userFName
        profileInfoObject.lastNameTF.text = userLName
        profileInfoObject.ageTF.text = userAge
        profileInfoObject.genderTF.text = userGender
        profileInfoObject.emailTF.text = userEmailID
        profileInfoObject.countryTF.text = userCountry
        profileInfoObject.firstNameLabel.text = userFName
        profileInfoObject.lastNameLabel.text = userLName
        profileInfoObject.ageLabel.text = userAge
        profileInfoObject.genderLabel.text = userGender
        profileInfoObject.emailLabel.text = userEmailID
        profileInfoObject.countryLabel.text = userCountry
        
    }
    
    func addSubViews() {
        profileInfoView.addSubview(profileInfoObject.firstNameLabel)
        profileInfoView.addSubview(profileInfoObject.lastNameLabel)
        profileInfoView.addSubview(profileInfoObject.genderLabel)
        profileInfoView.addSubview(profileInfoObject.ageLabel)
        profileInfoView.addSubview(profileInfoObject.countryLabel)
        profileInfoView.addSubview(profileInfoObject.emailLabel)
        profileInfoView.addSubview(profileInfoObject.firstNameTF)
        profileInfoView.addSubview(profileInfoObject.lastNameTF)
        profileInfoView.addSubview(profileInfoObject.genderTF)
        profileInfoView.addSubview(profileInfoObject.ageTF)
        profileInfoView.addSubview(profileInfoObject.countryTF)
        profileInfoView.addSubview(profileInfoObject.emailTF)
        view.addSubview(profileInfoView)
    }
    
    @objc func editProfile() {
        unhideTextFields()
    }
    func setupAutoLayout() {
        profileInfoView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileInfoView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profileInfoView.heightAnchor.constraint(equalToConstant: view.frame.height - 80).isActive = true
        profileInfoView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        profileInfoObject.firstNameLabel.topAnchor.constraint(equalTo:profileInfoView.topAnchor, constant: 60).isActive = true
        profileInfoObject.firstNameLabel.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.firstNameLabel.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.firstNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.lastNameLabel.topAnchor.constraint(equalTo:profileInfoObject.firstNameLabel.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.lastNameLabel.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.lastNameLabel.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.lastNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.ageLabel.topAnchor.constraint(equalTo:profileInfoObject.lastNameLabel.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.ageLabel.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.ageLabel.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.ageLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.genderLabel.topAnchor.constraint(equalTo:profileInfoObject.ageLabel.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.genderLabel.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.genderLabel.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.genderLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.countryLabel.topAnchor.constraint(equalTo:profileInfoObject.genderLabel.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.countryLabel.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.countryLabel.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.countryLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.emailLabel.topAnchor.constraint(equalTo:profileInfoObject.countryLabel.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.emailLabel.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.emailLabel.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.emailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.firstNameTF.topAnchor.constraint(equalTo:profileInfoView.topAnchor, constant: 60).isActive = true
        profileInfoObject.firstNameTF.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.firstNameTF.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.firstNameTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.lastNameTF.topAnchor.constraint(equalTo:profileInfoObject.firstNameTF.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.lastNameTF.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.lastNameTF.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.lastNameTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.ageTF.topAnchor.constraint(equalTo:profileInfoObject.lastNameTF.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.ageTF.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.ageTF.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.ageTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.genderTF.topAnchor.constraint(equalTo:profileInfoObject.ageTF.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.genderTF.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.genderTF.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.genderTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.countryTF.topAnchor.constraint(equalTo:profileInfoObject.genderTF.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.countryTF.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.countryTF.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.countryTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileInfoObject.emailTF.topAnchor.constraint(equalTo:profileInfoObject.countryTF.bottomAnchor, constant: 10).isActive = true
        profileInfoObject.emailTF.leftAnchor.constraint(equalTo:profileInfoView.leftAnchor, constant: 20).isActive = true
        profileInfoObject.emailTF.rightAnchor.constraint(equalTo:profileInfoView.rightAnchor, constant: -20).isActive = true
        profileInfoObject.emailTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func textFieldsHidden() {
        profileInfoObject.firstNameTF.isHidden = true
        profileInfoObject.lastNameTF.isHidden = true
        profileInfoObject.ageTF.isHidden = true
        profileInfoObject.genderTF.isHidden = true
        profileInfoObject.emailTF.isHidden = true
        profileInfoObject.countryTF.isHidden = true
        profileInfoObject.firstNameLabel.isHidden = false
        profileInfoObject.lastNameLabel.isHidden = false
        profileInfoObject.ageLabel.isHidden = false
        profileInfoObject.genderLabel.isHidden = false
        profileInfoObject.emailLabel.isHidden = false
        profileInfoObject.countryLabel.isHidden = false
    }
    
    func unhideTextFields() {
        profileInfoObject.firstNameTF.isHidden = false
        profileInfoObject.lastNameTF.isHidden = false
        profileInfoObject.ageTF.isHidden = false
        profileInfoObject.genderTF.isHidden = false
        profileInfoObject.emailTF.isHidden = false
        profileInfoObject.countryTF.isHidden = false
        profileInfoObject.firstNameLabel.isHidden = true
        profileInfoObject.lastNameLabel.isHidden = true
        profileInfoObject.ageLabel.isHidden = true
        profileInfoObject.genderLabel.isHidden = true
        profileInfoObject.emailLabel.isHidden = true
        profileInfoObject.countryLabel.isHidden = true
    }

}
