//
//  LoginViewController.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/23/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    internal let loginContentViewObject = LoginContentView()
    
    private let loginContentView: UIView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.7768785357, green: 0.7994685173, blue: 1, alpha: 1)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginContentView.addSubview(loginContentViewObject.nameTextField)
        loginContentView.addSubview(loginContentViewObject.passwordTextField)
        loginContentView.addSubview(loginContentViewObject.loginBtn)
        view.addSubview(loginContentView)
        view.backgroundColor = #colorLiteral(red: 0.7768785357, green: 0.7994685173, blue: 1, alpha: 1)
        setupAutoLayout()
    }
    
  
    func setupAutoLayout() {
        // Login Content View Constraints
        loginContentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginContentView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        loginContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Name TextField Constraints
        loginContentViewObject.nameTextField.topAnchor.constraint(equalTo:loginContentView.topAnchor, constant: 40).isActive = true
        loginContentViewObject.nameTextField.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant: 20).isActive = true
        loginContentViewObject.nameTextField.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant: -20).isActive = true
        loginContentViewObject.nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Password TextField Constraints
        loginContentViewObject.passwordTextField.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant: 20).isActive = true
        loginContentViewObject.passwordTextField.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant: -20).isActive = true
        loginContentViewObject.passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginContentViewObject.passwordTextField.topAnchor.constraint(equalTo:loginContentViewObject.nameTextField.bottomAnchor, constant: 20).isActive = true
        
        // Login Button Constraints
        loginContentViewObject.loginBtn.topAnchor.constraint(equalTo:loginContentViewObject.passwordTextField.bottomAnchor, constant: 20).isActive = true
        loginContentViewObject.loginBtn.leftAnchor.constraint(equalTo:loginContentView.leftAnchor, constant: 20).isActive = true
        loginContentViewObject.loginBtn.rightAnchor.constraint(equalTo:loginContentView.rightAnchor, constant: -20).isActive = true
        loginContentViewObject.loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}

