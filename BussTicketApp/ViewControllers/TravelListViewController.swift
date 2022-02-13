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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension TravelListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell") as! TravelListTableViewCell
        //cell.busImages.image = de
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
}
