//
//  HomeScreenViewController.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 13.02.2022.
//

import UIKit

class HomeScreenViewController: UIViewController {
      

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.layer.cornerRadius = 7
        destinationView.layer.cornerRadius = 12
        dateView.layer.cornerRadius = 12
        searchBtn.layer.cornerRadius = 10
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
