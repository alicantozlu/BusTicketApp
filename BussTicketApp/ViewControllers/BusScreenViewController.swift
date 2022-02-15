//
//  BusScreenViewController.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 15.02.2022.
//

import UIKit
import ALBusSeatView

class BusScreenViewController: UIViewController {

    @IBOutlet var goBackButton: UIButton!
    @IBOutlet var seatView: ALBusSeatView!
    var dataManager = SeatDataManager()
    
    var travelIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goBackButton.layer.cornerRadius = 10

        seatView.config = SeatConfig()
        seatView.delegate = dataManager
        seatView.dataSource = dataManager
        
        let mock = MockSeatCreater()
        let first = mock.create(count: 75)
        //let second = mock.create(count: 45)
        dataManager.seatList = [first/*,second*/]
        seatView?.reload()
    }
    
    @IBAction func goBackButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
