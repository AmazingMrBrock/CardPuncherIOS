//
//  _Customer.swift
//  CardPuncher
//
//  Created by Brock Swann on 2016-12-04.
//  Copyright © 2016 Brock Swann. All rights reserved.
//

import Foundation
open class _Customer{
    
    var name: String = ""
    var email: String = ""
    var stamps: Int64 = 0
    
    
    open func _Customer(_ name: String, email: String, stamps: Int64){
        self.name = name
        self.email = email
        self.stamps = stamps
    }
}
