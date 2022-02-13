//
//  HomeScreenViewController.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 13.02.2022.
//

import UIKit

class HomeScreenViewController: UIViewController {
      
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let onboardCheck = UserDefaults.standard.bool(forKey: "Onboarded")
        if(!onboardCheck){
            UserDefaults.standard.set(true, forKey: "Onboarded")
            self.onStart()
        }
    }
    
    func onStart () {
        let onboardingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingIdentity") as! ViewController
        onboardingVC.modalPresentationStyle = .fullScreen
        present(onboardingVC, animated: true, completion: nil)
    }
}
