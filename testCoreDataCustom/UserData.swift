//
//  UserData.swift
//  testCoreDataCustom
//
//  Created by Christopher Johnson on 10/24/15.
//  Copyright © 2015 Christopher Johnson. All rights reserved.
//

import Foundation

//fixed init problem from :
//https://github.com/mattneub/Programming-iOS-Book-Examples/blob/master/bk2ch23p798basicFileOperations/ch36p1053basicFileOperations/Person.swift

class UserData : NSObject, NSCoding {
    var myLat : Double = 0.332
    var myLong : Double = 1.11
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.myLat, forKey: "lat")
        aCoder.encodeObject(self.myLong, forKey: "long")
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        myLat = aDecoder.decodeObjectForKey("lat") as! Double
        myLong = aDecoder.decodeObjectForKey("long") as! Double
    }
    
    init(lat : Double, long : Double) {
        self.myLat = lat
        self.myLong = long
        super.init()
    }
}