//
//  TravelListViewController.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 13.02.2022.
//

import UIKit

class TravelListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var destinations = [DestinationModel]()
    var destination1: String = " "
    var destination2: String = " "
    var date: String = " "
    var hour: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        destinations.append(DestinationModel(image: "kamilKoc", time: "00:00", price: "260₺", travelTime: "5s 00dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "kamilKoc", time: "00:30", price: "250₺", travelTime: "5s 00dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "varan", time: "05:00", price: "250₺", travelTime: "7s 00dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "pamukkale", time: "05:00", price: "255₺", travelTime: "6s 30dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "metro", time: "06:30", price: "260₺", travelTime: "6s 30dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "metro", time: "07:00", price: "270₺", travelTime: "6s 30dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "pamukkale", time: "08:00", price: "280₺", travelTime: "6s 30dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "varan", time: "08:00", price: "300₺", travelTime: "8s 00dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "kamilKoc", time: "08:30", price: "300₺", travelTime: "6s 00dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "pamukkale", time: "10:00", price: "300₺", travelTime: "7s 30dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "metro", time: "10:00", price: "310₺", travelTime: "7s 30dk", destination1: destination1, destination2: destination2))
        destinations.append(DestinationModel(image: "kamilKoc", time: "10:00", price: "310₺", travelTime: "6s 00dk", destination1: destination1, destination2: destination2))
        
        tableView.register(UINib(nibName: "TravelTableViewCell", bundle: nil), forCellReuseIdentifier: "travelCellTest")
        /*tableView.register(UINib(nibName: "TravelListTableViewCell", bundle: nil), forCellReuseIdentifier: "travelCell")*/
    }
}

extension TravelListViewController: UITableViewDelegate, UITableViewDataSource, MessageDelegate{
    func sendMessage(from: String, to: String, date: String, hour: String) {
        self.destination1 = from
        self.destination2 = to
        self.date = date
        self.hour = hour
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCellTest") as! TravelTableViewCell
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell") as! TravelListTableViewCell*/
        cell.configure(model: destinations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
}
