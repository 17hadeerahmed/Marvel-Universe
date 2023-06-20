//
//  CoreData_servises.swift
//  MarvelUniverse
//
//  Created by Hader on 20/6/23.
//

import Foundation
import UIKit
import CoreData

protocol CoreDataProtocol {
    static func SaveToCoreData(descrip : String , creators : String ) ->()
}

class CoreDataManager : CoreDataProtocol {
    
    static func SaveToCoreData(descrip : String , creators : String ) {
        var context :NSManagedObjectContext?
        let appDelgate = UIApplication.shared.delegate as! AppDelegate
        context = appDelgate.persistentContainer.viewContext
        let uEntity = NSEntityDescription.entity(forEntityName: "CashDesc", in: context!)
        let user = NSManagedObject(entity: uEntity!, insertInto: context!)   //object from cash entity in coreData
        user.setValue(descrip , forKey: "descrip")
        user.setValue(creators , forKey: "creators")
       

        try? context?.save()
        
    }
}
