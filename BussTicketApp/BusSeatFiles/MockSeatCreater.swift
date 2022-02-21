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
    var salable: Bool
    var gender: Bool
    var hall: Bool
    var cellIdentifier:String // secili koltuklarin indexlerini duzgun alabilmek icin
}

class MockSeatCreater {
    
    var x:Int = 0
    func create(count: Int) -> [SeatStub] {
        
        // 3 8 13 18 23 28 33 38 43 48 53 58
        var NewCellIdentifier:String = ""
        
        var list = [SeatStub]()
        (1...count).forEach { (count) in
            let isHall = ((count - 2) % 5 == 1 || (count - 1) % 5 == 1)
            
            x = count
            if( x == 1){
                NewCellIdentifier = String(1)
            } else if ( x >= 2 && x <= 7 ){
                NewCellIdentifier = String(x - 2)
            } else if ( x >= 8 && x <= 13 ){
                NewCellIdentifier = String(x - 4)
            } else if ( x >= 13 && x <= 17 ){
                NewCellIdentifier = String(x - 6)
            } else if (x >= 18 && x <= 22 ){
                NewCellIdentifier = String(x - 8)
            } else if (x >= 23 && x <= 27 ){
                NewCellIdentifier = String(x - 10)
            } else if (x >= 28 && x <= 32 ){
                NewCellIdentifier = String(x - 12)
            } else if (x >= 33 && x <= 37 ){
                NewCellIdentifier = String(x - 14)
            } else if (x >= 38 && x <= 42 ){
                NewCellIdentifier = String(x - 16)
            } else if (x >= 43 && x <= 47 ){
                NewCellIdentifier = String(x - 18)
            } else if (x >= 48 && x <= 52 ){
                NewCellIdentifier = String(x - 20)
            } else if (x >= 53 && x <= 57 ){
                NewCellIdentifier = String(x - 22)
            } else if (x >= 58 && x <= 62 ){
                NewCellIdentifier = String(x - 24)
            } else if (x >= 63 && x <= 67 ){
                NewCellIdentifier = String(x - 26)
            } else if (x >= 68 && x <= 72 ){
                NewCellIdentifier = String(x - 28)
            } else if (x >= 73 && x <= 77 ){
                NewCellIdentifier = String(x - 30)
            } else if (x >= 78 && x <= 82 ){
                NewCellIdentifier = String(x - 32)
            } else if (x >= 83 && x <= 87 ){
                NewCellIdentifier = String(x - 34)
            } else if (x >= 88 && x <= 92 ){
                NewCellIdentifier = String(x - 36)
            } else if (x >= 93 && x <= 97 ){
                NewCellIdentifier = String(x - 38)
            } else if (x >= 98 && x <= 102 ){
                NewCellIdentifier = String(x - 40)
            } else if (x >= 103 && x <= 107 ){
                NewCellIdentifier = String(x - 42)
            } else if (x >= 108 && x <= 112 ){
                NewCellIdentifier = String(x - 44)
            }
            
            let stub = SeatStub(
                id: UUID().uuidString,
                number: count,
                salable: Bool.random(),
                gender: Bool.random(),
                hall: isHall,
                cellIdentifier: NewCellIdentifier)
        
            
            // 2li koltuklarda tekli oturmalarin onune gecmek icin
            if(list.count > 1 && list.count % 5 == 0){
                //print("\(list) \n")
                if(list[list.count-2].salable == false){
                    list[list.count-1].salable = false
                }else{
                    list[list.count-1].salable = true
                }
            }

            list.append(stub)
        }
        return list
    }
}
