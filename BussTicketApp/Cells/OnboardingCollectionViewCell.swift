//
//  OnboardingCollectionViewCell.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 11.02.2022.
//

import UIKit
import Lottie

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var actionButtonDidTap: (() -> Void)?
    
    
    func setup(slide: PageModel){
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
        
        let animation = Animation.named(slide.animationName)
        
        animationView.animation = animation
        animationView.loopMode = .loop
        
        if !animationView.isAnimationPlaying{ animationView.play() }
    }
}
