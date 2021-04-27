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
    let isValid: Observable<Bool>
    
    init() {
        isValid = Observable.combineLatest(self.fName.asObservable(), self.lName.asObservable(), self.gender.asObservable())
        { (fName, lName, gender) in
            return fName.isValidPassword()
                && lName.isValidPassword()
                && gender.isValidPassword()
        }
    }
}
