//
//  Coord.swift
//  testCoreDataCustom
//
//  Created by Christopher Johnson on 10/24/15.
//  Copyright © 2015 Christopher Johnson. All rights reserved.
//

import Foundation
import CoreData
import MapKit

class Coord: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    @NSManaged var latitude : Double
    @NSManaged var longitude : Double
    //@NSManaged var vtLocation : UserData?
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(context:NSManagedObjectContext) {
        // Core Data
        let entity =  NSEntityDescription.entityForName("Coord", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
}
