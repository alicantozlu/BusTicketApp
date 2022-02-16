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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // datePicker arkaplan rengi duzenlenmesi icin
      
        /*datePicker.subviews.first?.subviews.forEach { grayView in
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(red: 0, green: 47/255, blue: 121/255, alpha: 1)
            grayView.insertSubview(view, at: 0)
            view.topAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }*/
        
        
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
        let currentDate = Date()
        datePicker.date = currentDate
        
        let dateVal = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        date = dateFormatter.string(from: dateVal)
    }
    
    // set datePicker to tomorrow
    @IBAction func setDateTomorrowButton(_ sender: Any) {
        let currentDate = Date()
        datePicker.date = currentDate.tomorrow!
        
        let dateVal = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        date = dateFormatter.string(from: dateVal)
    }

    // Onboarding Screen`e Yonlendir
    func onStart () {
        let onboardingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingIdentity") as! ViewController
        onboardingVC.modalPresentationStyle = .fullScreen
        present(onboardingVC, animated: true, completion: nil)
    }
    
    @IBAction func datePickerVal(_ sender: Any) {
        let dateVal = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        date = dateFormatter.string(from: dateVal)
    }
    
    @IBAction func searchBtnAction(_ sender: Any) {
        //let dateFormatter = DateFormatter()
            
        guard let from = fromLebel.text else { return }
        guard let to = toLabel.text else { return }
        //let date = dateFormatter.string(from: datePicker.date)
        
        //self.delegate?.sendMessage(from: from, to: to, date: date, hour: hour)
        
        let sendVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TravelListIdentity") as! TravelListViewController
        
        sendVC.destination1 = from
        sendVC.destination2 = to
        sendVC.date = date
        /*sendVC.hour = hour*/
        
        sendVC.modalPresentationStyle = .fullScreen
        sendVC.modalTransitionStyle = .coverVertical
        present(sendVC, animated: true, completion: nil)
    }
}
/*
protocol MessageDelegate {
    func sendMessage(from: String,to: String, date: String, hour: String)
}*/

extension Date {
    var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)
    }
}

class ColoredDatePicker: UIDatePicker {
    var changed = false
    override func addSubview(_ view: UIView) {
        if !changed {
            changed = true
            self.setValue(UIColor.white, forKey: "textColor")
        }
        super.addSubview(view)
    }
}
