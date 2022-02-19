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
    @IBOutlet var setTest: UILabel!
    
    var dataManager = SeatDataManager()
    var travelIndex: Int = 0
    var first = [SeatStub]()
    var yolcuSayisi:Int = 0
    
    @objc func changeImage(){
        self.yolcuSayisi = dataManager.selectedSeatlist.count
        
        let alertController = UIAlertController(title: "Alım sınırına ulaştınız!", message: "Maksimum bilet alımı '5' ile sınırlandırılmıştır.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        yolcuHesapla()
    }
    
    static func countAlert(){
        
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
    
    //yolcusayisi ve kalan bos koltuk sayisi hesapla
    func yolcuHesapla(){
        for i in 0...first.count-1{
            if(first[i].salable == false && first[i].hall == false){
                yolcuSayisi += 1
            }
        }
    }
    
    @IBAction func buyButtonAction(_ sender: Any) {
        print("---->> \(dataManager.selectedSeatlist)")
        /*for i in 0...dataManager.selectedSeatlist.count-1{
             print("----->> \(dataManager.selectedSeatlist[i].cellIdentifier)")
         }*/
    }
    
    @IBAction func goBackButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
