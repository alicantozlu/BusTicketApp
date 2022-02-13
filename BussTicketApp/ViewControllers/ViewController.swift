//
//  OnboardingVC.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 11.02.2022.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var goToStartBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!

    var slides = [PageModel]()
    
    var currentPage = 0 {
        didSet{
            pageController.currentPage = currentPage
            
            if (currentPage == 0){
                goToStartBtn.isHidden = false
                goToStartBtn.setTitle("Skip", for: .normal)
                
                nextBtn.setTitleColor(UIColor(red: 0/255, green: 31/255, blue: 91/255, alpha: 1), for: .normal)
                nextBtn.backgroundColor = UIColor(red: 219/255, green: 248/255, blue: 255/255, alpha: 1)
                
            } else if (currentPage == slides.count-1){
                nextBtn.setTitle("Get Started", for: .normal)
                nextBtn.backgroundColor  = UIColor(red: 0/255, green: 31/255, blue: 91/255, alpha: 1)
                nextBtn.setTitleColor(UIColor(red: 219/255, green: 248/255, blue: 255/255, alpha: 1), for: .normal)
                
                goToStartBtn.isHidden = false
                goToStartBtn.setTitle("⏎", for: .normal)
                
            } else {
                nextBtn.setTitle("Next", for: .normal)
                nextBtn.backgroundColor = UIColor(red: 219/255, green: 248/255, blue: 255/255, alpha: 1)
                nextBtn.setTitleColor(UIColor(red: 0/255, green: 31/255, blue: 91/255, alpha: 1), for: .normal)
                
                goToStartBtn.isHidden = true
                goToStartBtn.setTitle("none", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let page1 = PageModel(title: "To Bus Ticket App!", description: "We are happy to see you.", animationName: "wellcome")
        let page2 = PageModel(title: "Safe & Easy Payment!", description: "Anti-froud technology \n & \n Advanced triple layered security", animationName: "secure")
        let page3 = PageModel(title: "Extra Spacing!", description: "Most spacious travel experience \n \n Enjoy extra space", animationName: "seats")
        let page4 = PageModel(title: "We Go Everywhere!", description: "65000+ Routes \n & \n Over 2300 Operators Worldwide", animationName: "bus_road")
        slides = [page1, page2, page3, page4]
        
        nextBtn.layer.cornerRadius = 15
    }
    
    
    @IBAction func nextBtnAction(_ sender: Any) {
        if(currentPage == slides.count-1){
            // navigate to the next page
            dismiss(animated: true, completion: nil)
        } else if(currentPage != slides.count-1){
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func goToStartBtnAction(_ sender: Any) {
        if(currentPage == 0){
            // Get Started a basildiginde gecilecek ekran calisacak
            dismiss(animated: true, completion: nil)
        } else if(currentPage == slides.count-1){
            nextBtn.setTitle("Next", for: .normal)
            currentPage = 0
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCellIdentifier", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide: slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
