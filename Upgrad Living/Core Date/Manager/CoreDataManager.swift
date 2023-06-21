//
//  CoreDataManager.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 13/06/23.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistanceContainer: NSPersistentContainer
    
    init() {
        persistanceContainer = NSPersistentContainer(name: "Upgrad")
        persistanceContainer.loadPersistentStores { description, error in
            if let error = error{
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func SaveNotify(title: String, body: String, module_type:String, screen_type: String, date: String, event_Id: String, ticket_Id:String, payment_Id: String){
        
        let Notify = NotifyInfo(context: persistanceContainer.viewContext)
        Notify.title = title
        Notify.body = body
        Notify.module_type = module_type
        Notify.screen_type = screen_type
        Notify.date = date
        Notify.event_Id = event_Id
        Notify.ticket_Id = ticket_Id
        Notify.payment_Id = payment_Id
        
        do{
            try persistanceContainer.viewContext.save()
        }catch{
            print("Failed to Save \(error.localizedDescription)")
        }
    }
}
