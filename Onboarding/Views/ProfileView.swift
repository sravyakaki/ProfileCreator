//
//  ProfileView.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/27/21.
//

import UIKit

class ProfileView: UIView {

    let firstNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "First name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lastNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Last name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Age"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Gender"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Country"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}



