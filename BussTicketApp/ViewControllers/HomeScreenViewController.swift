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
        
        underLine(label: fromLebel)
        underLine(label: toLabel)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        date = dateFormatter.string(from: Date())
        
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
    
    func underLine(label:UITextField){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: label.frame.height - 1, width: label.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor(red: 0, green: 31/255, blue: 91/255, alpha: 1).cgColor
        label.borderStyle = UITextField.BorderStyle.none
        label.layer.addSublayer(bottomLine)
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
        present(sendVC, animated: true, completion: nil)
    }
}

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
