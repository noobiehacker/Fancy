//
//  DataController.swift
//  Fancy
//
//  Created by davix on 12/7/16.
//  Copyright © 2016 geniemedialabs. All rights reserved.
//
import UIKit
import CoreData
class DataController: NSObject {
    
    var managedObjectContext: NSManagedObjectContext
    
    override init() {
        // This resource is the same name as your xcdatamodeld contained in your project.
        guard let modelURL = Bundle.main.url(forResource: "myCoreDataModel", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
        /* The directory the application uses to store the Core Data store file.
        This code uses a file named "DataModel.sqlite" in the application's documents directory.
        */
        let storeURL = docURL.appendingPathComponent("myCoreDataModel.sqlite")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
//        DispatchQueue.global(qos: .userInitiated).async {
//            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//            let docURL = urls[urls.endIndex-1]
//            /* The directory the application uses to store the Core Data store file.
//             This code uses a file named "DataModel.sqlite" in the application's documents directory.
//             */
//            let storeURL = docURL.appendingPathComponent("myCoreDataModel.sqlite")
//            do {
//                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
//            } catch {
//                fatalError("Error migrating store: \(error)")
//            }
//        }
    }
}
