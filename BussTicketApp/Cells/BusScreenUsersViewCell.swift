//
//  BusScreenUsersViewCell.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 19.02.2022.
//

import UIKit

class BusScreenUsersViewCell: UITableViewCell {

    @IBOutlet var nameSurnameTextField: UITextField!
    @IBOutlet var idNoTextField: UITextField!
    @IBOutlet var hesCodeTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
