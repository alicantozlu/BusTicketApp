//
//  TicketsViewController.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 21.02.2022.
//

import UIKit

class TicketsViewController: UIViewController {

    @IBOutlet var ticketTableView: UITableView!
    @IBOutlet var fromLabel: UILabel!
    @IBOutlet var toLabel: UILabel!
    @IBOutlet var travelStartLabel: UILabel!
    @IBOutlet var travelLengthLabel: UILabel!
    @IBOutlet var travelEndLabel: UILabel!
        
    var tickets = [UserModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tickets)
        fromLabel.text = HomeScreenViewController.newTicket.from
        toLabel.text = HomeScreenViewController.newTicket.to
        travelStartLabel.text = HomeScreenViewController.newTicket.saat.time
        travelLengthLabel.text = HomeScreenViewController.newTicket.length
        travelEndLabel.text = HomeScreenViewController.newTicket.endTime
        
        
        self.ticketTableView.rowHeight = 223
        print("\(tickets)")

        ticketTableView.register(UINib(nibName: "TicketTableViewCell", bundle: nil), forCellReuseIdentifier: "ticketCell")
    }
    @IBAction func goBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension TicketsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketTableViewCell
        cell.fromLabel.text = HomeScreenViewController.newTicket.from
        cell.toLabel.text = HomeScreenViewController.newTicket.to
        cell.startLabel.text = HomeScreenViewController.newTicket.saat.time
        cell.dateLabel.text = HomeScreenViewController.newTicket.tarih.date
        cell.ticketCostLabel.text = HomeScreenViewController.newTicket.price
        
        cell.passengerLabel.text = tickets[indexPath.row].nameSurname
        cell.seatNumLabel.text = tickets[indexPath.row].seatNumber
        cell.idLabel.text = tickets[indexPath.row].idNumber
        return cell
    }
    
    
}
