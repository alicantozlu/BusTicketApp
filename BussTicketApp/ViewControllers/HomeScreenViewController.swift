//
//  HomeScreenViewController.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 13.02.2022.
//

import UIKit

class HomeScreenViewController: UIViewController {
    @IBOutlet var fromLebel: UITextField!
    @IBOutlet var toLabel: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchTextButton: UIButton!
    //var delegate: MessageDelegate?
    
    var date:String = ""
    
    static var newTicket = Ticket(passengerName: "", date: "", time: "", to: "", from: "", price: "", length: "", endTime:"", seatNum: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fromLebel.underLine()
        toLabel.underLine()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        date = dateFormatter.string(from: Date())
        
        let onboardCheck = UserDefaults.standard.bool(forKey: "Onboarded")
        if(!onboardCheck){
            UserDefaults.standard.set(true, forKey: "Onboarded")
            self.onStart()
        }
    }
    
    // Nereden Nereye yazilarini yer degistir
    @IBAction func switchTextButtonAction(_ sender: Any) {
        let temp = fromLebel.text
        fromLebel.text = toLabel.text
        toLabel.text = temp
    }
    
    // set datePicker to today
    @IBAction func setDateTodayButton(_ sender: Any) {
        datePicker.date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        date = dateFormatter.string(from: Date())
    }
    
    // set datePicker to tomorrow
    @IBAction func setDateTomorrowButton(_ sender: Any) {
        datePicker.date = Date().tomorrow!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        date = dateFormatter.string(from: Date().tomorrow!)
    }

    // Onboarding Screen`e Yonlendir
    func onStart () {
        let onboardingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingIdentity") as! ViewController
        onboardingVC.modalPresentationStyle = .fullScreen
        present(onboardingVC, animated: true, completion: nil)
    }
    
    @IBAction func datePickerVal(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        date = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func searchBtnAction(_ sender: Any) {
        guard let from = fromLebel.text else { return }
        guard let to = toLabel.text else { return }
        
        if(from == "" || to == ""){
            let alertController = UIAlertController(title: "Hata!", message: "Lütfen boş yerleri doldurunuz.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        let sendVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TravelListIdentity") as! TravelListViewController
        sendVC.destination1 = from
        sendVC.destination2 = to
        sendVC.date = date
        sendVC.modalPresentationStyle = .fullScreen
        sendVC.modalTransitionStyle = .coverVertical
        
        HomeScreenViewController.newTicket.from = from
        HomeScreenViewController.newTicket.to = to
        HomeScreenViewController.newTicket.tarih.date = date
        
        present(sendVC, animated: true, completion: nil)
    }
}
