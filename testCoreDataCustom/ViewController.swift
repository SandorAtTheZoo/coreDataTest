//
//  ViewController.swift
//  testCoreDataCustom
//
//  Created by Christopher Johnson on 10/24/15.
//  Copyright © 2015 Christopher Johnson. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //initialize fetchedResultsController....our intermediary between core data and view?
//        do{
//            try fetchedResultsController.performFetch()
//        } catch {
//            print("extra code for one line error...")
//        }
        let fetchRequest = NSFetchRequest(entityName: "Coord")
        
        do {
            let results =
            try sharedAppDelegate.managedObjectContext.executeFetchRequest(fetchRequest)
            let zoom = results as! [NSManagedObject]
            print("ZOOOM : \(zoom)")
            //only works with this implementation, but only returns what's about to be saved to the context....
            //let coords : Coord = Coord(context: self.sharedAppDelegate.managedObjectContext)
            let savedLat = zoom[2].valueForKey("latitude") as! Double
            print("+++++: \(savedLat)")
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        
        //let entity : NSEntityDescription = NSEntityDescription.entityForName("Coord", inManagedObjectContext: sharedAppDelegate.managedObjectContext)!
        //print("value of latitude???? : \(entity.valueForKey("latitude"))")
        
//        do {
//            let fetchedLat = try sharedAppDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as NSArray
//            print("FETCH : \(fetchedLat.objectAtIndex(0))")
//            //latitude.text = String(fetchedLat)
//        } catch {
//            print("failed fetch request")
//        }

    }
    
    override func viewDidAppear(animated: Bool) {
        //let oldData = self.fetchedResultsController.valueForKey("vtLocation")
        //print("old data : \(oldData)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setMyCoords(sender: UIButton) {
        let coords : Coord = Coord(context: self.sharedAppDelegate.managedObjectContext)
        let lat = Double(self.latitude.text!)!
        let long = Double(self.longitude.text!)!
        //let newCoords : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: long )
        coords.latitude = lat
        coords.longitude = long
        self.saveContext()
        print("things : \(lat), \(long), \(coords)")
        let savedLat = coords.valueForKey("latitude") as! Double
        print("____: \(savedLat)")
    }
    
    // MARK: - Core Data Convenience
    
    var sharedAppDelegate: AppDelegate  {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return delegate
    }
    
    func saveContext() {
        sharedAppDelegate.saveContext()
    }
    
    
//    // Step 1: This would be a nice place to paste the lazy fetchedResultsController
//    lazy var fetchedResultsController : NSFetchedResultsController = {
//        let fetchRequest = NSFetchRequest(entityName: "Coord")
//        
//        //fetchRequest.sortDescriptors = [NSSortDescriptor(key: "vtLocation", ascending: true)]
//        //add this line for movies...only using movies with chosen actor
//        //fetchRequest.predicate = NSPredicate(format: "actor == %@", self.actor)
//        
//        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.sharedAppDelegate.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
//        
//        return fetchedResultsController
//        }()
    
    
}

