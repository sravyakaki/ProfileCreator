//
//  LoginValdiation.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/26/21.
//

import Foundation
import RxCocoa
import RxSwift

struct LoginViewModel {
    let email = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
    let isValid: Observable<Bool>
    
    init() {
        isValid = Observable.combineLatest(self.email.asObservable(), self.password.asObservable())
        { (email, password) in
            return email.isValidEmail()
                && password.isValidPassword()
        }
    }
}


extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        return self.count >= 4
    }

}
