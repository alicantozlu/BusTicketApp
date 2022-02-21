//
//  TicketTableViewCell.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 21.02.2022.
//

import UIKit

class TicketTableViewCell: UITableViewCell {

    @IBOutlet var fromLabel: UILabel!
    @IBOutlet var toLabel: UILabel!
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var passengerLabel: UILabel!
    @IBOutlet var seatNumLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var ticketCostLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
