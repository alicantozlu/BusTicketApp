//
//  BusScreenUsersViewCell.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 19.02.2022.
//

import UIKit

class BusScreenUsersViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var nameSurnameTextField: UITextField!
    @IBOutlet var idNoTextField: UITextField!
    @IBOutlet var hesCodeTextField: UITextField!
    @IBOutlet var seatNumberLabel: UILabel!
    
    var user: UserModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*idNoTextField.delegate = self
        nameSurnameTextField.delegate = self
        hesCodeTextField.delegate = self*/
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        user.nameSurname = nameSurnameTextField.text!
        user.idNumber = idNoTextField.text!
        user.hesCode = hesCodeTextField.text!
        user.seatNumber = seatNumberLabel.text!
        
        BusScreenViewController.users.append(user)
       // print("\(user.nameSurname)")
    }
    
   /* override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
    
}
