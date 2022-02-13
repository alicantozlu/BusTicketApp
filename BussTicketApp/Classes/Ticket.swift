//
//  Ticket.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 13.02.2022.
//

import Foundation

class Ticket {
    var yolcu: Yolcu
    var tarih: Tarih
    var saat: Saat
    var koltuk: Int
    var koltukSayisi: Int = 0

    func karsilastir(){
        // gorsel arayuz tasarlaninca gerek kalmaycak
    }
    func koltukAyir(){
        /*
         Parametre “koltukSayisi”, 1 ile 5 arasında değer
         alabilir. Eğer koltukSayisi bu fonksiyon çağrılmadan
         önce sıfırdan büyük ise, hiçbir işlem yapılmaz.
         Eğer sıfır ise, koltukSayisi değişkenine, verilen
         parametre değeri atanır. Ayrıca, bu değer büyüklüğünde
         koltuk dizisi oluşturulur.
         */
    }
    func koltukNoEkle(){
        //Parametre olarak verilen numara 1 ile 45 arasında olabilir. Parametre değeri, koltuk dizisine kaydedilir.
    }
    func yazdir(){
        // <AD> <SOYAD> <ID>, <GUN>/<AY>/<YIL>, <SAAT>:<DAKIKA> | <koltuk_no1> <koltuk_no2> . . .
    }
    
    init(yolcu:Yolcu,tarih:Tarih,saat:Saat,){
        
    }
}
