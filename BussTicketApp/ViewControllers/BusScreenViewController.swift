//
//  BusScreenViewController.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 15.02.2022.
//

import UIKit

class BusScreenViewController: UIViewController {

    @IBOutlet var goBackButton: UIButton!
    var travelIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goBackButton.layer.cornerRadius = 10

        
    }
    
    @IBAction func goBackButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
