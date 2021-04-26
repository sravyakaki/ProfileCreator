//
//  OnboardingFormViewController.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/26/21.
//

import UIKit

class OnboardingFormViewController: UIViewController {
    
    private let onboardingFormView: UIView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.7768785357, green: 0.7994685173, blue: 1, alpha: 1)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7768785357, green: 0.7994685173, blue: 1, alpha: 1)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
}
