//
//  OnboardingVC.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 11.02.2022.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var goToStartBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var slides = [PageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let page1 = PageModel(title: "To Bus Ticket App!", description: "We are happy to see you.", animationName: "wellcome")
        let page2 = PageModel(title: "Safe & Easy Payment!", description: "Anti-froud technology \n & \n Advanced triple layered security", animationName: "secure")
        let page3 = PageModel(title: "Extra Spacing!", description: "All seats have 2 meter spacing \n \n Enjoy extra space", animationName: "seats")
        let page4 = PageModel(title: "We Go Everywhere!", description: "65000+ Routes \n & \n Over 2300 Operators Worldwide", animationName: "bus_road")
        slides = [page1, page2, page3, page4]
    }
    
    @IBAction func goToStartBtnAction(_ sender: Any) {
        
        
        
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {

        
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCellIdentifier", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide: slides[indexPath.row])
        return cell
    }
    
}
