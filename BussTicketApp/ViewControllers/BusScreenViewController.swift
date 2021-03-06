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
        print("\(first)")
        dataManager.seatList = [first]
        seatView?.reload()
        
        usersTableView.register(UINib(nibName: "BusScreenUsersViewCell", bundle: nil), forCellReuseIdentifier: "usersCellIdentifier")
    }
    
    @objc func changeImage(){
        self.selectedSeatCount = dataManager.selectedSeatlist.count
        usersTableView.reloadData()
        if(self.selectedSeatCount == 5){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: "alertIdentity") as! AlertViewController
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            myAlert.textMessage = "Otob??s firmas?? tek seferde en fazla 5 koltu??un sat??lmas??na izin veriyor."
            self.present(myAlert, animated: true, completion: nil)
            return
        }
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

        if (dataManager.selectedSeatlist.isEmpty){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: "alertIdentity") as! AlertViewController
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            myAlert.textMessage = "L??ften koltuk se??iniz."
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
        // Bos kullanici bilgisi
        let ndx1 = IndexPath(row:(0), section: 0)
        let cell1 = ticketListCollectionView.cellForRow(at:ndx1) as! BusScreenUsersViewCell
        if (cell1.nameSurnameTextField.text!.isEmpty || cell1.idNoTextField.text!.isEmpty || cell1.hesCodeTextField.text!.isEmpty){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert = storyboard.instantiateViewController(withIdentifier: "alertIdentity") as! AlertViewController
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            myAlert.textMessage = "L??ften bo?? alanlar?? doldurunuz."
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
        // Kullanici bilgisinin biletlere kayit edilmesi
        var ticketsTemp = [UserModel]()
        for i in 0...dataManager.selectedSeatlist.count-1{
             //print("----->> \(dataManager.selectedSeatlist[i].cellIdentifier)")
            let ndx = IndexPath(row:(0), section: 0)
            let cell = ticketListCollectionView.cellForRow(at:ndx) as! BusScreenUsersViewCell
            let userName = cell.nameSurnameTextField.text!
            let userID = cell.idNoTextField.text!
            let userHES = cell.hesCodeTextField.text!
            let userSeatNum = String(dataManager.selectedSeatlist[i].cellIdentifier)
            ticketsTemp.append(UserModel(nameSurname: userName, idNumber: userID, hesCode: userHES, seatNumber: userSeatNum))
            
            // Satilan koltuk icin deger duzenlenmesi
            HomeScreenViewController.reservedSeats[dataManager.selectedSeatlist[i].number-1].salable = false
            HomeScreenViewController.reservedSeats[dataManager.selectedSeatlist[i].number-1].gender = dataManager.selectedSeatlist[i].gender
        }
        
        //Ekran yonlendirmesi veri aktarimi
        let ticketVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ticketVcIdentifier") as! TicketsViewController
        ticketVC.tickets = ticketsTemp
        ticketVC.modalTransitionStyle = .crossDissolve
        ticketVC.modalPresentationStyle = .fullScreen
        present(ticketVC, animated: true, completion: nil)
    }
    
    //Sefer Liste ekranina don
    @IBAction func goBackButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension BusScreenViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//self.selectedSeatCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCellIdentifier") as! BusScreenUsersViewCell
        cell.nameSurnameTextField.underLine()
        cell.idNoTextField.underLine()
        cell.hesCodeTextField.borderStyle = UITextField.BorderStyle.none
        cell.seatNumberLabel.text = ""// String(dataManager.selectedSeatlist[indexPath.row].cellIdentifier)
        return cell
    }
}
