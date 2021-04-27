//
//  OnboardingFormViewController.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/26/21.
//

import UIKit
import RxSwift
import RxCocoa

class OnboardingFormViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    internal let onboardFormViewObject = OnboardFormView()
    let viewModel = OnboardingFormViewModel()
    let disposeBag = DisposeBag()
    var userEnteredEmailID: String = ""
    
    private let onboardingFormView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7768785357, green: 0.7994685173, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "Add Profile"
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        view.backgroundColor = #colorLiteral(red: 0.7768785357, green: 0.7994685173, blue: 1, alpha: 1)
        addSubViews()
        setupAutoLayout()
        onboardFormViewObject.emailLabel.text = "Email ID: \(userEnteredEmailID)"
        formValidationsWithRXSwift()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @objc func logoutUser(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    func formValidationsWithRXSwift() {
        onboardFormViewObject.fNameTextField.rx.text.orEmpty.bind(to: viewModel.fName)
            .disposed(by: disposeBag)
        onboardFormViewObject.lNameTextField.rx.text.orEmpty.bind(to: viewModel.lName)
            .disposed(by: disposeBag)
        onboardFormViewObject.genderTextField.rx.text.orEmpty.bind(to: viewModel.gender)
            .disposed(by: disposeBag)
        viewModel.isValid.map { $0 }
            .bind(to: onboardFormViewObject.saveBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        onboardFormViewObject.saveBtn.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        if onboardFormViewObject.ageTextField.text != "" {
         let profileVC = ProfileViewController()
         self.navigationController?.pushViewController(profileVC, animated: true)
            
        } else {
            let alert = UIAlertController(title: "Please enter age", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) {
                (UIAlertAction) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func addSubViews() {
        onboardingFormView.addSubview(onboardFormViewObject.fNameTextField)
        onboardingFormView.addSubview(onboardFormViewObject.lNameTextField)
        onboardingFormView.addSubview(onboardFormViewObject.ageTextField)
        onboardingFormView.addSubview(onboardFormViewObject.genderTextField)
        onboardingFormView.addSubview(onboardFormViewObject.countryTextField)
        onboardingFormView.addSubview(onboardFormViewObject.emailLabel)
        onboardingFormView.addSubview(onboardFormViewObject.saveBtn)
        onboardingFormView.addSubview(onboardFormViewObject.noteLabel)
        view.addSubview(onboardingFormView)
    }
    
    func setupAutoLayout() {
        onboardingFormView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        onboardingFormView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        onboardingFormView.heightAnchor.constraint(equalToConstant: view.frame.height - 80).isActive = true
        onboardingFormView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        onboardFormViewObject.fNameTextField.topAnchor.constraint(equalTo:onboardingFormView.topAnchor, constant: 60).isActive = true
        onboardFormViewObject.fNameTextField.leftAnchor.constraint(equalTo:onboardingFormView.leftAnchor, constant: 20).isActive = true
        onboardFormViewObject.fNameTextField.rightAnchor.constraint(equalTo:onboardingFormView.rightAnchor, constant: -20).isActive = true
        onboardFormViewObject.fNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        onboardFormViewObject.lNameTextField.topAnchor.constraint(equalTo:onboardFormViewObject.fNameTextField.bottomAnchor, constant: 10).isActive = true
        onboardFormViewObject.lNameTextField.leftAnchor.constraint(equalTo:onboardingFormView.leftAnchor, constant: 20).isActive = true
        onboardFormViewObject.lNameTextField.rightAnchor.constraint(equalTo:onboardingFormView.rightAnchor, constant: -20).isActive = true
        onboardFormViewObject.lNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        onboardFormViewObject.ageTextField.topAnchor.constraint(equalTo:onboardFormViewObject.lNameTextField.bottomAnchor, constant: 10).isActive = true
        onboardFormViewObject.ageTextField.leftAnchor.constraint(equalTo:onboardingFormView.leftAnchor, constant: 20).isActive = true
        onboardFormViewObject.ageTextField.rightAnchor.constraint(equalTo:onboardingFormView.rightAnchor, constant: -20).isActive = true
        onboardFormViewObject.ageTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        onboardFormViewObject.genderTextField.topAnchor.constraint(equalTo:onboardFormViewObject.ageTextField.bottomAnchor, constant: 10).isActive = true
        onboardFormViewObject.genderTextField.leftAnchor.constraint(equalTo:onboardingFormView.leftAnchor, constant: 20).isActive = true
        onboardFormViewObject.genderTextField.rightAnchor.constraint(equalTo:onboardingFormView.rightAnchor, constant: -20).isActive = true
        onboardFormViewObject.genderTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        onboardFormViewObject.countryTextField.topAnchor.constraint(equalTo:onboardFormViewObject.genderTextField.bottomAnchor, constant: 10).isActive = true
        onboardFormViewObject.countryTextField.leftAnchor.constraint(equalTo:onboardingFormView.leftAnchor, constant: 20).isActive = true
        onboardFormViewObject.countryTextField.rightAnchor.constraint(equalTo:onboardingFormView.rightAnchor, constant: -20).isActive = true
        onboardFormViewObject.countryTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        onboardFormViewObject.emailLabel.topAnchor.constraint(equalTo:onboardFormViewObject.countryTextField.bottomAnchor, constant: 10).isActive = true
        onboardFormViewObject.emailLabel.leftAnchor.constraint(equalTo:onboardingFormView.leftAnchor, constant: 20).isActive = true
        onboardFormViewObject.emailLabel.rightAnchor.constraint(equalTo:onboardingFormView.rightAnchor, constant: -20).isActive = true
        onboardFormViewObject.emailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        onboardFormViewObject.saveBtn.topAnchor.constraint(equalTo:onboardFormViewObject.emailLabel.bottomAnchor, constant: 20).isActive = true
        onboardFormViewObject.saveBtn.leftAnchor.constraint(equalTo:onboardingFormView.leftAnchor, constant: 20).isActive = true
        onboardFormViewObject.saveBtn.rightAnchor.constraint(equalTo:onboardingFormView.rightAnchor, constant: -20).isActive = true
        onboardFormViewObject.saveBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        onboardFormViewObject.noteLabel.topAnchor.constraint(equalTo:onboardFormViewObject.saveBtn.bottomAnchor, constant: 30).isActive = true
        onboardFormViewObject.noteLabel.leftAnchor.constraint(equalTo:onboardingFormView.leftAnchor, constant: 20).isActive = true
        onboardFormViewObject.noteLabel.rightAnchor.constraint(equalTo:onboardingFormView.rightAnchor, constant: -20).isActive = true
        onboardFormViewObject.noteLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    
}
