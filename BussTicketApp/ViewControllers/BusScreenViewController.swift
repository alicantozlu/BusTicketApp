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
    @IBOutlet var yolcuSayisiLabel: UILabel!
    @IBOutlet var bosKoltukLabel: UILabel!
    @IBOutlet var buyButton: UIButton!
    
    var dataManager = SeatDataManager()
    var travelIndex: Int = 0
    var first = [SeatStub]()
    var yolcuSayisi:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
            
       /* var a = dataManager.selectedSeatlist.count {
            change{
                if(a == 5){
                    print("asdfasdgadsasfasdf")
                }
            }
        }*/

    }
    
    //yolcusayisi ve kalan bos koltuk sayisi hesapla
    func yolcuHesapla(){
        for i in 0...first.count-1{
            if(first[i].salable == false && first[i].hall == false){
                yolcuSayisi += 1
            }
        }
        yolcuSayisiLabel.text = String(yolcuSayisi)
        bosKoltukLabel.text = String(45 - yolcuSayisi)
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
    
   /* func showAlert(){
        let alertController = UIAlertController(title: "Alım sınırına ulaştınız!", message: "Maksimum bilet alımı '5' ile sınırlandırılmıştır.\nDaha fazla bilgi için lütfen destek ekibine ulaşınız.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }*/

}
