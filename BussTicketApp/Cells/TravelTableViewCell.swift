//
//  TravelTableViewCell.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 14.02.2022.
//

import UIKit

class TravelTableViewCell: UITableViewCell {
    
    @IBOutlet var busImages: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var travelTimeLabel: UILabel!
    @IBOutlet var destinationView: UIView!
    @IBOutlet weak var destination1Label: UILabel!
    @IBOutlet weak var destination2Label: UILabel!
<<<<<<< HEAD
    @IBOutlet var dateLabel: UILabel!
=======
>>>>>>> 8d7acbd44428813affbfe02ddb136a768b90b7d4
    
    override func awakeFromNib() {
        super.awakeFromNib()
        destinationView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(model: DestinationModel) {
        self.busImages.image = UIImage(named: model.image)
        self.timeLabel.text = model.time
        self.priceLabel.text = model.price
        self.travelTimeLabel.text = model.travelTime
        self.destination1Label.text = model.destination1
        self.destination2Label.text = model.destination2
<<<<<<< HEAD
        self.dateLabel.text = model.date
=======
>>>>>>> 8d7acbd44428813affbfe02ddb136a768b90b7d4
    }
}
