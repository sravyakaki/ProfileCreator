//
//  OnboardFormView.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/26/21.
//

import UIKit

internal final class OnboardFormView: UIView {
    
    let fNameTextField: UITextField = {
        let txtField = UITextField()
        txtField.backgroundColor = .white
        txtField.placeholder = "First Name *"
        txtField.borderStyle = .roundedRect
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    let lNameTextField: UITextField = {
        let txtField = UITextField()
        txtField.backgroundColor = .white
        txtField.placeholder = "Last Name *"
        txtField.borderStyle = .roundedRect
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    let ageTextField: UITextField = {
        let txtField = UITextField()
        txtField.backgroundColor = .white
        txtField.placeholder = "Age *"
        txtField.borderStyle = .roundedRect
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    let genderTextField: UITextField = {
        let txtField = UITextField()
        txtField.backgroundColor = .white
        txtField.placeholder = "Gender *"
        txtField.borderStyle = .roundedRect
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    let countryTextField: UITextField = {
        let txtField = UITextField()
        txtField.backgroundColor = .white
        txtField.placeholder = "Country"
        txtField.borderStyle = .roundedRect
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "To do"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let saveBtn: UIButton = {
        let btn = UIButton(type:.system)
        btn.backgroundColor = .blue
        btn.setTitle("Done", for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let noteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Note: Everything marked with an * is mandatory"
        label.font = UIFont.italicSystemFont(ofSize: 10.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

