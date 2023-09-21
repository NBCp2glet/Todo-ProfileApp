//
//  DataManager.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import UIKit
import CoreData

class DataManager {
    static let dataManager = DataManager()
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    init() {}
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ToDoModel")
    
    func readData() {
        do {
            let todoDataArray = try context?.fetch(fetchRequest) as? [ToDo]
            // todoDataArray를 사용하여 검색된 데이터에 접근합니다.
            print("read: \(todoDataArray?.first?.title)")
        } catch {
            print("데이터 검색 중 오류 발생: \(error)")
        }
    }
    
    func createData() {
        if let context = context {
            if let entity = NSEntityDescription.entity(forEntityName: "ToDoModel", in: context) {
                let todoData = NSManagedObject(entity: entity, insertInto: context) as! ToDo
                
                todoData.title = "Todo Title"
                todoData.category = "Todo Category"
                todoData.isCompleted = false
                todoData.createDate = Date()
                todoData.modifyDate = Date()
                todoData.id = UUID()
                
                do {
                    try context.save()
                    print("create")
                } catch {
                    print("데이터 저장 중 오류 발생: \(error)")
                }
            }
        }
    }
    
    func updateData(ToDo: ToDo) {
        fetchRequest.predicate = NSPredicate(format: "id == %@", ToDo.id! as CVarArg) // UniqueID에 원하는 ID를 넣습니다.
        if let context = context {
            do {
                let todoDataArray = try context.fetch(fetchRequest) as? [ToDo]
                if let todoData = todoDataArray?.first {
                    todoData.title = "New Title"
                    try context.save()
                    print("update")
                }
            } catch {
                print("데이터 업데이트 중 오류 발생: \(error)")
            }
        }
    }
    
    func deleteData(ToDo: ToDo) {
        fetchRequest.predicate = NSPredicate(format: "id == %@", ToDo.id! as CVarArg ) // UniqueID에 원하는 ID를 넣습니다.
        if let context = context {
            do {
                let todoDataArray = try context.fetch(fetchRequest)
                if let todoData = todoDataArray.first {
                    context.delete(todoData)
                    try context.save()
                    print("delete")
                }
            } catch {
                print("데이터 삭제 중 오류 발생: \(error)")
            }
        }
    }
}
