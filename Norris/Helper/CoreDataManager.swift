//
//  CoreDataManager.swift
//  Norris
//
//  Created by Bárbara Souza on 18/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.
//

import CoreData
import UIKit

protocol CoreDataManagerProtocol: class {
    func updateFacts(models: [FactModel], tag: String?)
    func fetchFacts(with text: String) -> [FactModel]
    func fetchCategory(with category: String) -> [FactModel]
    func fetchFacts(with total: Int) -> [FactModel]
}

class CoreDataManager: CoreDataManagerProtocol {
    private let entityName = "Fact"
    private let contextManager: ManagedContextProtocol
    private var fetchRequest: NSFetchRequest<NSManagedObject>
    
    init(contextManager: ManagedContextProtocol = ManagedContext()) {
        self.contextManager = contextManager
        self.fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
    }
    
    func updateFacts(models: [FactModel], tag: String?) {
        if let tag = tag {
            fetchRequest.predicate = NSPredicate(format: "tag == %@ ", tag)
        } else {
            fetchRequest.predicate = NSPredicate(format: "category == %@ && tag == %@",
                                                 [models.first?.categories?.first ?? NorrisStrings.uncategorized, ""])
        }
        contextManager.delete(with: fetchRequest)
        contextManager.saveData(models: models, tag: tag ?? "", entityName: entityName)
    }
    
    func fetchFacts(with text: String) -> [FactModel] {
        fetchRequest.predicate = NSPredicate(format: "tag == %@ ", text)
        return modelHandler(contextManager.fetch(with: fetchRequest))
    }
    
    func fetchCategory(with category: String) -> [FactModel] {
        fetchRequest.predicate = NSPredicate(format: "category == %@ ", category)
        return modelHandler(contextManager.fetch(with: fetchRequest))
    }
    
    func fetchFacts(with total: Int) -> [FactModel] {
        return Array(modelHandler(contextManager.fetch(with: fetchRequest)).prefix(total))
    }
    
    private func modelHandler(_ data: [NSManagedObject]) -> [FactModel] {
        var result = [FactModel]()
        for model in data {
            guard let url = model.value(forKeyPath: "url") as? String,
                let value = model.value(forKeyPath: "text") as? String,
                let category = model.value(forKey: "category") as? String else { break }
            result.append(FactModel(url: url,
                                    value: value,
                                    categories: [category]))
        }
        
        return result
    }
}
