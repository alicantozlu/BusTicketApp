//
//  MockSeatCreater.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 15.02.2022.
//

import Foundation

struct SeatStub {
    let id: String
    var number: Int
    let salable: Bool
    var gender: Bool
    let hall: Bool
}

class MockSeatCreater {
    func create(count: Int) -> [SeatStub] {
        var list = [SeatStub]()
        (1...count).forEach { (count) in
            let isHall = ((count - 2) % 5 == 1 || (count - 1) % 5 == 1)
            let stub = SeatStub(
                id: UUID().uuidString,
                number: count,
                salable: Bool.random(),
                gender: Bool.random(),
                hall: isHall)
            list.append(stub)
        }
        return list
    }
}
