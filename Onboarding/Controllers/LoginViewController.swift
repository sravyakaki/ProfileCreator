//
//  LoginViewController.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/23/21.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    internal let loginContentViewObject = LoginContentView()
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    let onboardVC = OnboardingFormViewController()
    
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
        validationsWithRXSwift()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    func validationsWithRXSwift() {
        loginContentViewObject.nameTextField.rx.text.orEmpty.bind(to: viewModel.email)
        .disposed(by: disposeBag)
        loginContentViewObject.passwordTextField.rx.text.orEmpty.bind(to: viewModel.password)
        .disposed(by: disposeBag)
        viewModel.isValid.map { $0 }
        .bind(to: loginContentViewObject.loginBtn.rx.isEnabled)
        .disposed(by: disposeBag)
        loginContentViewObject.loginBtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
  
    @objc func loginButtonTapped() {
        let alert = UIAlertController(title: "Login Successful", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            (UIAlertAction) in
            self.navigationController?.pushViewController(self.onboardVC, animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    func setupAutoLayout() {
        // Login Content View Constraints
        loginContentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginContentView.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
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

