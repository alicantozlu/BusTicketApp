//
//  travelInfo.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 18.02.2022.
//

import Foundation

struct TravelModel: Decodable{
    var image: String?
    var time: String?
    var price: String?
    var travelTime: String?
    var endTime: String?
}
