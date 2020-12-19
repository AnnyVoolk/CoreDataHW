//
//  PersistentContainer.swift
//  HomeWork2
//
//  Created by Anna Volkova on 13.12.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import CoreData
import Foundation

class DatabaseService {
    
    lazy var readCoreData: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    lazy var newCoreData: NSManagedObjectContext = {
        let moc = persistentContainer.newBackgroundContext()
        return moc
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Jobs")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
