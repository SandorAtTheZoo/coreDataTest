//
//  UserData.swift
//  testCoreDataCustom
//
//  Created by Christopher Johnson on 10/24/15.
//  Copyright © 2015 Christopher Johnson. All rights reserved.
//

import Foundation

class UserData : NSObject, NSCoding {
    var myLat : Double = 0.332
    var myLong : Double = 1.11
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(myLat, forKey: "lat")
        aCoder.encodeObject(myLong, forKey: "long")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        myLat = aDecoder.decodeObjectForKey("lat") as! Double
        myLong = aDecoder.decodeObjectForKey("long") as! Double
    }
    
    override init() {
        
    }
}