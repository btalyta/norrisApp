//
//  ManagedContext.swift
//  Norris
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import CoreData
import UIKit

protocol ManagedContextProtocol {
    func fetch(with fetchRequest: NSFetchRequest<NSManagedObject>) -> [NSManagedObject]
    func delete(with fetchRequest: NSFetchRequest<NSManagedObject>)
    func saveData(models: [FactModel], tag: String, entityName: String)
}

class ManagedContext: ManagedContextProtocol {
    private var delegateApp: AppDelegate?
    
    init() {
        self.delegateApp = UIApplication.shared.delegate as? AppDelegate
    }
    
    func fetch(with fetchRequest: NSFetchRequest<NSManagedObject>) -> [NSManagedObject] {
        guard let delegate = delegateApp else { return [] }
        let managedContext = delegate.persistentContainer.viewContext
        
        do {
            let data = try managedContext.fetch(fetchRequest)
            return data
        } catch {
            return []
        }
    }
    
    func delete(with fetchRequest: NSFetchRequest<NSManagedObject>) {
        guard let delegate = delegateApp else { return }
        let managedContext = delegate.persistentContainer.viewContext
        
        do {
            let data = try managedContext.fetch(fetchRequest)
            for object in data {
                managedContext.delete(object)
            }
            try managedContext.save()
        } catch {
            return
        }
    }
    
    func saveData(models: [FactModel], tag: String, entityName: String) {
        guard let delegate = delegateApp else { return }
        let managedContext = delegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: entityName,
                                                      in: managedContext)  else { return }
        
        for model in models {
            let fact = NSManagedObject(entity: entity, insertInto: managedContext)
            let category = model.categories?.first ?? NorrisStrings.uncategorized
            
            fact.setValue(category, forKey: "category")
            fact.setValue(model.url, forKey: "url")
            fact.setValue(model.value, forKey: "text")
            fact.setValue(tag, forKey: "tag")
        }
        
        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
