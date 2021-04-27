//
//  OnboardingFormViewModel.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/26/21.
//

import Foundation
import RxCocoa
import RxSwift

struct OnboardingFormViewModel {
    let fName = BehaviorRelay<String>(value: "")
    let lName = BehaviorRelay<String>(value: "")
    let gender = BehaviorRelay<String>(value: "")
    let age = BehaviorRelay<String>(value: "")
    let isValid: Observable<Bool>
    
    init() {
        isValid = Observable.combineLatest(self.fName.asObservable(), self.lName.asObservable(), self.gender.asObservable(), self.age.asObservable())
        { (fName, lName, gender, age) in
            return fName.isValidFName()
                && lName.isValidLName()
                && gender.isValidGender()
                && age.isValidAge()
        }
    }
}

extension String {
    
    func isValidFName() -> Bool {
        let nameRegex = "[A-Za-z]"
        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return nameTest.evaluate(with: self)
    }
    
    func isValidLName() -> Bool {
        let nameRegex = "[A-Za-z]"
        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return nameTest.evaluate(with: self)
    }
    
    func isValidAge() -> Bool {
        let ageRegex = "^[0-9]*$"
        let ageTest = NSPredicate(format:"SELF MATCHES %@", ageRegex)
        return ageTest.evaluate(with: self)
    }
    
    func isValidGender() -> Bool {
        let genderRegex =  "[A-Za-z]"
        let genderTest = NSPredicate(format:"SELF MATCHES %@", genderRegex)
        return genderTest.evaluate(with: self)
    }
    
}
