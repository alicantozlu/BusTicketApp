//
//  BusScreenViewController.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 15.02.2022.
//

import UIKit
import ALBusSeatView
import Lottie

class BusScreenViewController: UIViewController {

    @IBOutlet var goBackButton: UIButton!
    @IBOutlet var seatView: ALBusSeatView!
    @IBOutlet var buyButton: UIButton!
    @IBOutlet var swipeArrowView: AnimationView!
    @IBOutlet var usersTableView: UITableView!
    @IBOutlet var ticketListCollectionView: UITableView!
    
    var dataManager = SeatDataManager()
    var travelIndex: Int = 0
    var first = [SeatStub]()
    var selectedSeatCount:Int = 0
    
    @objc func changeImage(){
        self.selectedSeatCount = dataManager.selectedSeatlist.count
        usersTableView.reloadData()
        if(self.selectedSeatCount == 5){
            let alertController = UIAlertController(title: "Uyarı!", message: "Otobüs firması tek seferde en fazla 5 koltuğun satılmasına izin veriyor.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usersTableView.rowHeight = 253
        
        let notificationCenter: NotificationCenter = .default
        notificationCenter.addObserver(self, selector: #selector(changeImage), name: .sendDataNotification, object: nil)
        
        configSwipeArrow()
        
        goBackButton.layer.cornerRadius = 10
        
        seatView.config = SeatConfig()
        seatView.delegate = dataManager
        seatView.dataSource = dataManager
        
        let mock = MockSeatCreater()
        first = mock.create(count: 75)
        //let second = mock.create(count: 45)
        dataManager.seatList = [first/*,second*/]
        seatView?.reload()
        
        usersTableView.register(UINib(nibName: "BusScreenUsersViewCell", bundle: nil), forCellReuseIdentifier: "usersCellIdentifier")
    }
    
    //Kaydirma animasyonu
    func configSwipeArrow(){
        let animation = Animation.named("arrow2")
        swipeArrowView.animation = animation
        swipeArrowView.loopMode = .loop
        if !swipeArrowView.isAnimationPlaying{ swipeArrowView.play() }
        Timer.scheduledTimer(withTimeInterval: 6.3, repeats: true) { timer in
            self.swipeArrowView.isHidden = true
            self.swipeArrowView.stop()
            timer.invalidate()
        }
    }
    
    @IBAction func buyButtonAction(_ sender: Any) {
        if dataManager.selectedSeatlist.isEmpty{
            let alertController = UIAlertController(title: "Uyarı!", message: "Lütfen koltuk seçiniz.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        var ticketsTemp = [UserModel]()
        for i in 0...dataManager.selectedSeatlist.count-1{
             //print("----->> \(dataManager.selectedSeatlist[i].cellIdentifier)")
            let ndx = IndexPath(row:(i), section: 0)
            let cell = ticketListCollectionView.cellForRow(at:ndx) as! BusScreenUsersViewCell
            let userName = cell.nameSurnameTextField.text!
            let userID = cell.idNoTextField.text!
            let userHES = cell.hesCodeTextField.text!
            let userSeatNum = String(dataManager.selectedSeatlist[i].cellIdentifier)
            ticketsTemp.append(UserModel(nameSurname: userName, idNumber: userID, hesCode: userHES, seatNumber: userSeatNum))
        }
        let ticketVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ticketVcIdentifier") as! TicketsViewController
        ticketVC.tickets = ticketsTemp
        ticketVC.modalTransitionStyle = .crossDissolve
        ticketVC.modalPresentationStyle = .fullScreen
        present(ticketVC, animated: true, completion: nil)
    }
    
    @IBAction func goBackButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension BusScreenViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.selectedSeatCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCellIdentifier") as! BusScreenUsersViewCell
        cell.nameSurnameTextField.underLine()
        cell.idNoTextField.underLine()
        cell.hesCodeTextField.borderStyle = UITextField.BorderStyle.none
        cell.seatNumberLabel.text = String(dataManager.selectedSeatlist[indexPath.row].cellIdentifier)
        return cell
    }
}
