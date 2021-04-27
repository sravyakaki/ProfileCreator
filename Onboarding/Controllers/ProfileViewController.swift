//
//  ProfileViewController.swift
//  Onboarding
//
//  Created by Sravya Kaki on 4/27/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "Profile Info"
//        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutUser))
//        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        view.backgroundColor = #colorLiteral(red: 0.7768785357, green: 0.7994685173, blue: 1, alpha: 1)
        
    }
}
