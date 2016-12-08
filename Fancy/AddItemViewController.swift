//
//  AddItemViewController.swift
//  Fancy
//
//  Created by davix on 12/2/16.
//  Copyright © 2016 geniemedialabs. All rights reserved.
//
import Foundation
import UIKit
import SugarRecord
import CoreData

@objc class AddItemViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addItemToDatabase(name: String, important : Bool, urgent : Bool) -> Bool{
        
        let dataController = DataController.init()
        let itemDAO = ToDoItemDAO.init(storage: dataController.managedObjectContext)
        return itemDAO.addItem(name: name, important: important, urgent: urgent)
    }
    
    func coreDataStorage() -> CoreDataDefaultStorage {
        let store = CoreDataStore.named("db")
        let bundle = Bundle(for: self.classForCoder)
        let model = CoreDataObjectModel.merged([bundle])
        let defaultStorage = try! CoreDataDefaultStorage(store: store, model: model)
        return defaultStorage
    }
    
}
