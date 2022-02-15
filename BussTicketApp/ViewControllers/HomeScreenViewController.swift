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
    
    @IBOutlet var fromLebel: UITextField!
    @IBOutlet var toLabel: UITextField!
    @IBOutlet var dateLabel: UITextField!
    @IBOutlet var hourLabel: UITextField!
    
    //var delegate: MessageDelegate?
    
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
    
    @IBAction func searchBtnAction(_ sender: Any) {
        guard let from = fromLebel.text else { return }
        guard let to = toLabel.text else { return }
        guard let date = dateLabel.text else { return }
        guard let hour = hourLabel.text else { return }
        //self.delegate?.sendMessage(from: from, to: to, date: date, hour: hour)
        
        let sendVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TravelListIdentity") as! TravelListViewController
        
        sendVC.destination1 = from
        sendVC.destination2 = to
        sendVC.date = date
        sendVC.hour = hour
        
        sendVC.modalPresentationStyle = .fullScreen
        sendVC.modalTransitionStyle = .coverVertical
        present(sendVC, animated: true, completion: nil)
    }
}
/*
protocol MessageDelegate {
    func sendMessage(from: String,to: String, date: String, hour: String)
}*/
